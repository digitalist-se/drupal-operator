# Drupal Operator by Digitalist Open Tech

Drupal Operator is a Kubernetes operator that handles Drupal deployments.
The operator is by default namespaced scoped, so it needs to exist in the same
namespace as you want to deploy to.

A simple example deployment looks like this:

```yaml
apiVersion: ozzi.io/v1alpha2
kind: Drupal
metadata:
  name: myexample-drupal
spec:
  tag: 8.7-apache # docker tag
  drupal_image: drupal:{{ tag }}
  files_accessmode: ReadWriteMany
  drupal_extra_config: |
    $conf['bar'] = 'foo';
    $conf['foo'] = 'bar';
```

By default the operator uses a promtail sidecar for logs, and a configmap like this is needed:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: promtail-drupal
data:
  promtail.yaml: >
    server:
      http_listen_port: 9080
      grpc_listen_port: 0
      log_level: "debug"
    positions:
      filename: /tmp/positions.yaml
    clients: # Specify target
      - url: http://loki.monitoring.svc.cluster.local:3100/loki/api/v1/push #This should point to loki internal adress, or what ever used.
    scrape_configs:
      - job_name:  "drupal"
        static_configs:
          - targets:
              - localhost
            labels:
              app: "drupal"
              __path__: /var/log/drupal/*.log # Any file .log in the EmptyDir Volume.
```

To disable promtail sidecar, you need to set: `drupal_promtail: false`, like:

```yaml
apiVersion: ozzi.io/v1alpha2
kind: Drupal
metadata:
  name: myexample-drupal
spec:
  tag: 8.7-apache # docker tag
  drupal_image: drupal:{{ tag }}
  drupal_promtail: false
  files_accessmode: ReadWriteMany
  drupal_extra_config: |
    $conf['bar'] = 'foo';
    $conf['foo'] = 'bar';
```



For all config variables, see the [variables file](variables.md).

## Installation

### Service account

The operator needs a serviceaccount to work, start with creating that:

```bash
kubectl create sa drupal-operator
```

### Install  CRD

```bash
kubectl apply -f install/crd/install.yaml
```

### Install RBAC

Edit the file, so the namespace matches the namespace you want to deploy
the operator to. Namespace is set to drupal.

```bash
kubectl apply -f install/rbac/install.yaml
```

### Install the operator itself

```bash
kubectl apply -f install/operator.yaml
```
