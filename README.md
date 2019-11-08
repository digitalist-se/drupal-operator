# Drupal Operator

This is a fork of <https://github.com/thom8/drupal-operator>.

[TOC]

This fork adds some new settings and possibilities, too make it more granular in it's approach, and also adds the possibility to use images from private docker repositories.

## Prerequisites
To work with this operator you need a Kubernetes cluster. Working with the examples in this operator you could use microk8s or minikube or something else for local development. Or you could have a production cluster - but please note that this is in alpha stage and not recommended for production use yet.

## Install Operator

```bash
kubectl apply -f deploy/crds/drupal_v1alpha2_drupal_crd.yaml
kubectl apply -f deploy/
```

## Install Drupal

If everything works out, you could install an example Drupal installation, example for minikube and microk8s:

###  Minikube

```bash
kubectl apply -f deploy/crds/minikube-example.yaml
```

Now you could reach your deployment with: `minikube service example-drupal-minikube-1-nodeport --url`

### Microk8s

```bash
microk8s.kubectl apply -f deploy/crds/micro8s-example.yaml
```



## Logs from operator

Get you pod name, and you could get logs from the drupal operator, ansible or operator style logs are available.

```bash
kubectl logs -n drupal -f -c operator drupal-operator-randomstring
kubectl logs -n drupal -f -c ansible drupal-operator-randomstring
```



## Create another Drupal instance

Once the operator is installed in a namespace you can create another `Drupal` resource (this using microk8s)

```bash
apiVersion: ozzi.io/v1alpha2
kind: Drupal
metadata:
  name: myexample-drupal
spec:
  tag: 8.7-apache # docker tag
  drupal_image: drupal:{{ tag }}
  type: production
  db_pvc: microk8s-hostpath
  files_pvc: microk8s-hostpath
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

