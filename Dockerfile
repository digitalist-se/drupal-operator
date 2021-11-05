FROM quay.io/operator-framework/ansible-operator:v1.13.1

LABEL   org.opencontainers.image.authors="mikke.schiren@digitalistgroup.com, ole.von.stuckrad@digitalistgroup.com" \
        org.opencontainers.image.vendor="Digitalist Sweden AB" \
        org.opencontainers.image.title="Drupal Operator" \
        org.opencontainers.image.description="Adds a custom resource called Drupal to K8s and manages its lifecycle." \
        org.opencontainers.image.version="3.0.0" \
        org.opencontainers.image.revision="2978e29" \
        org.opencontainers.image.created="2020-11-16T18:41:18+0100" \
        org.opencontainers.image.source="https://gitlab.wklive.net/se-ops/drupal-operator" \
        org.opencontainers.image.url="https://hub.docker.com/r/ozziio/drupal-operator"

#ENV ANSIBLE_JINJA2_NATIVE=True
ENV ANSIBLE_DEBUG_LOGS=false
ENV ANSIBLE_VERBOSITY_DRUPAL_OZZI_IO=1
COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible
COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
