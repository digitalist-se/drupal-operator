# Drupal Operator

![](https://tokei.rs/b1/github/thom8/drupal-operator)

This is a very early working POC for development of an drupal [Ansible operator](https://github.com/operator-framework/operator-sdk/blob/master/doc/proposals/ansible-operator.md), feedback is welcomed!

## Install Operator

```bash
kubectl apply -f deploy/crds/drupal_v1alpha1_drupal_cr.yaml
```

```bash
kubectl apply -f deploy/
```

## Drupal installed

If everything works out, a Drupal instance should have been created when you installed the operator.

Create another Drupal instance

Once the operator is installed in a namespace you can create another `Drupal` resource.

```bash
apiVersion: drupal.org/v1alpha1
kind: Drupal
metadata:
  name: my-drupal
spec:
  version: 8.6
  type: production
  db_pvc: 1Gi
  files_pvc: 1Gi

```

This will automatically trigger the operator to run the ansible playbook and deploy a new Drupal :)

Expose Drupal in a load balancer

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

