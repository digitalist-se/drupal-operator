# Drupal Operator

This is a fork of <https://github.com/thom8/drupal-operator>.

This uses [microk8s](https://microk8s.io/) by default. To get it to work with another setup, you need to create (if it does not exist) a persistent  volume class, and change the file `deploy/crds/drupal_v1alpha1_drupal_crd.yaml` to use that pvc.

[TOC]

This fork adds some new settings and possibilities, too make it more granular in it's approach, and also adds the possibility to use images from private docker repositories.

## Install Operator

```bash
kubectl apply -f deploy/crds/drupal_v1alpha1_drupal_crd.yaml
kubectl apply -f deploy/
```

## Install Drupal

If everything works out, you could install an example Drupal installation with:

```bash
kubectl apply -f deploy/crds/drupal_v1alpha1_drupal_cr.yaml
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

For more information about how to use the Drupal Operator, see the [docs](docs/README.md).

