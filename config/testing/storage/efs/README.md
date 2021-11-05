# AWS EFS

Adapted for testing.

You need to change the namespace under `ClusterRoleBinding.subjects["kind: ServiceAccount, namespace: ..."]` in rbac.yaml manually.

If you change the prefix ("osdk" per default), you have to change a lot of references manually as well.

This is based on https://github.com/kubernetes-incubator/external-storage/tree/master/aws/efs

k apply -f rbac.yaml
k apply -f manifest.yaml
k apply -f secret.yaml
