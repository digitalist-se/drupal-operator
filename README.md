# Drupal Operator

This is a fork of <https://github.com/thom8/drupal-operator>.

This is still just a POC, and still needs to solve some tasks to make site installable (see Todo).

This fork adds some new settings and possibilities, too make it more granular in it's approach.  

Three big differences:

* MySQL and Drupal are not running in the same pod, this is because we want the possibility to scale up  drupal pods.
* The variables db_pvc and files_pvc now has now meaning - now they variables for Storage classes, db_pvc_size and files_pvc_size are replacement of the old ones.
* ReadWriteMany is supported on the Drupal node PVC, so that you can scale up.

## Todo

* Add a site install role so site could be installed (now, it just errors out, because when we have an existing settings.php in place, drupal thinks it is installed).
* Import config with drush role.
* Add the possibility to use config split

## Install Operator

```bash
kubectl apply -f deploy/crds/drupal_v1alpha1_drupal_cr.yaml
kubectl apply -f deploy/
```

## Install Drupal

If everything works out, you could install an example drupal installation with:

```bash
kubectl apply -f deploy/crds/drupal_v1alpha1_drupal_crd.yaml
```

## Logs from operator

Get you pod name, and you could get logs from the drupal operator, ansible or operator style logs are available.

k logs -n drupal -f -c operator drupal-operator-randomstring
k logs -n drupal -f -c ansible drupal-operator-randomstring

## Create another Drupal instance

Once the operator is installed in a namespace you can create another `Drupal` resource.

```bash
apiVersion: drupal.org/v1alpha1
kind: Drupal
metadata:
  name: myexample-drupal
spec:
  tag: 8.7-apache # docker tag
  drupal_image: drupal:{{ tag }}
  type: production
  db_pvc_size: 1Gi
  files_pvc_size: 4Gi
  drupal_extra_config: |
    $conf['bar'] = 'foo';
    $conf['foo'] = 'bar';
  drupal_replicas: 2

```

Save file as myexample.yaml, and then deploy it like: 

```bash
kubectl apply -f myexample.yaml
```

This will automatically trigger the operator to run the ansible playbook and deploy a new Drupal, with 2 replicas.

## Advanced examples

### Example 1

```bash
apiVersion: drupal.org/v1alpha1
kind: Drupal
metadata:
  name: myexample-drupal
spec:
  tag: 8.7-apache # docker tag
  drupal_image: drupal:{{ tag }}
  type: production
  db_pvc: gp2
  db_pvc_size: 1Gi
  files_pvc: aws-efs
  files_pvc_size: 1Gi
  files_accessmode: ReadWriteMany
  drupal_extra_config: |
    $conf['bar'] = 'foo';
    $conf['foo'] = 'bar';
  drupal_replicas: 2
```

In example 1 we have two storage classes that we have added to kubernetes, gp2 (default in aws) and aws-efs, and we can use them for storage. 

### Example 2

```bash
apiVersion: drupal.org/v1alpha1
kind: Drupal
metadata:
  name: my-drupal
database:
  database: drupal
spec:
  drupal_replicas: 2
  tag: 8 # docker tag
  drupal_image: my.private.registry/drupal:{{ tag }}
  drupal_image_reg_secret: my.private.registry
```

In example 2 we are using a docker container from a private registry, and using the secret my.private.registry that we have added before in kubernetes.

## Expose Drupal in a load balancer

To get the name of our deployment, we could run:

```bash
kubectl get deployments
```

In the preinstalled case, we should see that the deployment is called `example-drupal-drupal`.

So to expose this deployment we will add 

```bash
kubectl expose deployment example-drupal-drupal --type=LoadBalancer --name=example-drupal
```

And then run 

```bash
 kubectl describe service example-drupal
```

To get the LoadBalancer Ingress (external IP) of the site. 

(if you have setup kubernetes on Amazon, your External IP could look like: a8997a521aeed11e98ddf062fdf637ee-122456455.eu-west-1.elb.amazonaws.com, and could take some minute or two to be available)

