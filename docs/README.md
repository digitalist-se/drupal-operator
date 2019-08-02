Documentation

For basic information, see [README.md](../README.md) in root directory.

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