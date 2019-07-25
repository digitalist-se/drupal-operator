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

Once the operator is installed in a namespace you can create `Drupal` resources.

```bash
apiVersion: drupal.org/v1alpha1
kind: Drupal
metadata:
  name: mydrupal-drupal
spec:
  version: 8.6
```

This will automatically trigger the operator to run the ansible playbook and deploy a new Drupal :)

Expose Drupal in a load balancer

