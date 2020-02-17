FROM quay.io/operator-framework/ansible-operator:v0.15.1

ENV WORKER_DRUPAL_OZZI_IO=1
COPY watches.yaml ${HOME}/watches.yaml
COPY playbook.yaml ${HOME}/playbook.yaml
COPY roles ${HOME}/roles
