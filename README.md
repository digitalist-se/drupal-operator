# Drupal Operator (ozziio/drupal-operator)[https://hub.docker.com/r/ozziio/drupal-operator]

The Drupal operator is part of digitalists offering [ozzi.io](https://www.ozzi.io/).

[[TOC]]

## Acknowledgements

This is a fork of <https://github.com/thom8/drupal-operator>.

This fork adds some new settings and possibilities, to make it more granular in it's approach, and also adds the possibility to use images from private docker repositories.

## Prerequisites

To work with this operator you need a Kubernetes cluster (tested on 1.17). Working with the examples in this operator you could use microk8s or minikube or something else for local development. Or you could have a production cluster - but please note that this is in alpha stage and not recommended for production use yet.


## Install Operator

Use the makefile to install the custom resource (CR) and the operator image, service accounts etc.

The scope is cluster-wide, which means the operator is installed in its own namespace and has access to all other namespaces.

```bash
# Edit KUBECONFIG and VERSION.
cp .env.example .env
source .env
make install
make deploy IMG=$IMG
```

## Important notice

_Never_ run `make uninstall` on the live cluster. Removing the CRDs will trigger removal of _all_ resources created in the cluster (sites and databases).

## Install Drupal

If everything works out, you can install an example Drupal installation, check (the example)[./examples/drupal-example-crd.yaml]

###  Minikube

```bash
kubectl apply -f examples/minikube-example.yaml
```
Get the name of the nodeport service: `kubectl get svc`.

Now you could reach your deployment with: `minikube service example-drupal-nodeport --url`

### Microk8s

```bash
microk8s.kubectl apply -f examples/micro8s-example.yaml
```
Now you could reach your deployment with the CLUSTER-IP: `microk8s.kubectl get service microk8s-nodeport`

## Logs from the operator

```bash
kubectl logs -fn drupal-operator-controller-manager-xxxx -c manager
```

## Backups

An S3 backup cronjob is built in, if you activate it, but for better control of backups, you could use something like this:
For better control of backups, you could use something like https://blah.cloud/automation/using-velero-for-k8s-backup-and-restore-of-csi-volumes/


# Developing the Drupal operator

Currently using 1.12 of the operator-sdk.

Follow the installation guide in the official docs
for the (operator-sdk)[https://sdk.operatorframework.io/docs/building-operators/ansible/].

You can develop locally with minikube or kind, or you can use a live cluster (read "Development Tips" in the official docs).


```bash
# Edit KUBECONFIG and VERSION.
# Use .env.local.example for local usage with kind
cp .env.example .env
source .env
make docker-build IMG=$IMG
# Login to docker hub beforehand.
make docker-push IMG=$IMG
# Creates the CRDs
make install
# Creates the operator and all dependant resources
make deploy IMG=$IMG
```

## Testing with molecule

```bash
# Run a whole test cycle: create - test - removing
OPERATOR_IMAGE=${OPERATOR_IMAGE} TEST_OPERATOR_NAMESPACE=molecule-test molecule test

# Run a test cycle, without destroying everything after testing: create - test
OPERATOR_IMAGE=${OPERATOR_IMAGE} TEST_OPERATOR_NAMESPACE=molecule-test molecule converge

# Iterate on a test, after having run "converge"
OPERATOR_IMAGE=${OPERATOR_IMAGE} TEST_OPERATOR_NAMESPACE=molecule-test molecule verify

# Remove everything.
OPERATOR_IMAGE=${OPERATOR_IMAGE} TEST_OPERATOR_NAMESPACE=molecule-test molecule destroy
```