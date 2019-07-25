#!/usr/bin/env bash

# rebuild operator
operator-sdk build digitalist/drupal-operator:v0.0.1 
docker push digitalist/drupal-operator:v0.0.1

# redeploy operator
kubectl delete -f deploy/ -n drupal
kubectl delete -f deploy/crds/drupal_v1alpha1_drupal_cr.yaml -n drupal
kubectl apply -f deploy/crds/drupal_v1alpha1_drupal_cr.yaml -n drupal
kubectl apply -f deploy/ -n drupal
