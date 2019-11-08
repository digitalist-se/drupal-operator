#!/usr/bin/env bash

# rebuild operator
operator-sdk build ozziio/drupal-operator:v0.0.2
docker push ozziio/drupal-operator:v0.0.2

# redeploy operator
microk8s.kubectl delete -f deploy/
microk8s.kubectl delete -f deploy/crds/ozzio_v1alpha2_drupal_crd.yaml
#microk8s.kubectl apply -f deploy/
microk8s.kubectl apply -f deploy/crds/ozzio_v1alpha2_drupal_crd.yaml
microk8s.kubectl apply -f deploy/
