# Variables for Drupal Operator

## Config table

|key  |default   |usage   |note   |
|---|---|---|---|
|drupal_operator_image: |ozziio/drupal-operator:3.1.3| | |
|busybox_image: |busybox:1.35.0| | |
|drupal_run_as_user: |1000| | |
|drupal_run_as_group: |2000| | |
|drupal_fsgroup: |3000| | |
|auto_backup: |false| | |
|db_image: |mariadb:10.9.7| | |
|db_resources_requests_memory: |200Mi| | |
|db_resources_requests_cpu: |100m| | |
|db_resources_limits_memory: |1024Mi| | |
|db_resources_limits_cpu: |1000m| | |
|drupal_nodeport: |true| | |
|drupal_loadbalancer: |false| | |
|drupal_loadbalancer_port: |80| | |
|drupal_loadbalancer_target_port: |80| | |
|backup_endpoint: |`**None**`| | |
|backup_cron_schedule: |`0 3 * * *`| | |
|backup_cron_successfulJobsHistoryLimit: |1| | |
|backup_cron_failedJobsHistoryLimit: |1| | |
|backup_files_cron_schedule: |`0 5 * * *`| | |
|backup_files_cron_successfulJobsHistoryLimit: |1| | |
|backup_files_cron_failedJobsHistoryLimit: |1| | |
|auto_files_backup: |false| | |
|mysql_root_password: |root| | |
|no_mariadb: |false| | |
|postgres: |false| | |
|postgres_image: |postgres:10.18| | |
|postgres_resources_requests_memory: |70Mi| | |
|postgres_resources_requests_cpu: |10m| | |
|postgres_resources_limits_memory: |512Mi| | |
|postgres_resources_limits_cpu: |250m| | |
|postgres_pvc: |default| | |
|postgres_pvc_size: |250M| | |
|postgres_container_port: |5432| | |
|postgres_driver: |'pgsql'| | |
|postgres_namespace: |'Drupal\\Core\\Database\\Driver\\pgsql'| | |
|postgres_charset: |'utf8mb4'| | |
|postgres_collation: |'utf8mb4_swedish_ci'| | |
|memcached_image: |memcached:1.6.10-alpine| | |
|memcached_resources_requests_memory: |70Mi| | |
|memcached_resources_requests_cpu: |10m| | |
|memcached_resources_limits_memory: |512Mi| | |
|memcached_resources_limits_cpu: |250m| | |
|memcached_container_port: |11211| | |
|change_cause: |update| | |
|drupal_name: |drupal| | |
|drupal_ports_container_port: |80| | |
|drupal_ports_port: |80| | |
|drupal_locale: |en| | |
|drupal_image: |drupal:9.5.10-php8.2-apache| | |
|drupal_image_secret: |true| | |
|drupal_image_reg_secret: |''| | |
|drupal_image_pull_policy: |'IfNotPresent'| | |
|drupal_resources_requests_memory: |128Mi| | |
|drupal_resources_requests_cpu: |90m| | |
|drupal_resources_limits_memory: |1024Mi| | |
|drupal_resources_limits_cpu: |1000m| | |
|drupal_readinessProbe_initialDelaySeconds: |5| | |
|drupal_readinessProbe_periodSeconds: |5| | |
|drupal_readinessProbe_timeoutSeconds: |120| | |
|drupal_livenessProbe_tcpSocket_port: |80| | |
|drupal_livenessProbe_initialDelaySeconds: |10| | |
|drupal_livenessProbe_periodSeconds: |10| | |
|drupal_livenessProbe_timeoutSeconds: |3| | |
|drupal_php_memory_limit: |512M| | |
|drupal_php_post_max_size: |1024M| | |
|drupal_php_upload_max_filesize: |500M| | |
|drupal_php_ini_file: |'/usr/local/etc/php/conf.d/operator.ini'| | |
|drupal_php_ini_subPath: |'operator.ini'| | |
|drupal_root: |'/opt/drupal'| | |
|drupal_web_root: |'/opt/drupal/web'| | |
|drupal_replicas: |1| | |
|drupal_cron_schedule: |`*/5 * * * *`| | |
|drupal_cron_args: |'cd {{ drupal_web_root }}/sites/default && {{ drupal_web_root }}/../vendor/bin/drush cron'| | |
|drupal_cron_shell: |/bin/bash| | |
|drupal_cron_activeDeadlineSeconds: |6000| | |
|drupal_cron_successfulJobsHistoryLimit: |1| | |
|drupal_cron_failedJobsHistoryLimit: |1| | |
|drupal_cron_restartPolicy: |Never| | |
|drupal_cron_concurrencyPolicy: |Forbid| | |
|drupal_config_split: |basic_site_settings| | |
|drupal_config_import: |true| | |
|drupal_user: |'drupal'| | |
|drupal_password: |'drupal'| | |
|drupal_reset_admin: |false| | |
|drupal_db: |'drupal'| | |
|drupal_db_username: |'drupal'| | |
|drupal_db_pass: |'d3upa1'| | |
|drupal_db_prefix: |''| | |
|drupal_db_port: |'3306'| | |
|drupal_db_driver: |'mysql'| | |
|drupal_db_namespace: |'Drupal\\Core\\Database\\Driver\\mysql'| | |
|drupal_translation_path: |'sites/default/files/translations'| | |
|drupal_extra_config: |''| | |
|drupal_config_system_performance_css_preprocess: |"TRUE"| | |
|drupal_config_system_performance_js_preprocess: |"TRUE"| | |
|drupal_set_uuid: |true| | |
|adminer: |false| | |
|adminer_image: |adminer:4.8.1-standalone| | |
|adminer_container_port: |8080| | |
|adminer_target_port: |8080| | |
|drupal_uuid: |'a0bb6f1c-dda6-477b-938a-4f0219775c28'| | |
|drupal_override_site_install: |false| | |
|drupal_site_install:|| | |
|drupal_drush_update_database_command: |'updb -y'| | |
|drupal_drush_config_import_command: |'cim -y'| | |
|drupal_drush_config_import_first_command: |'cim --partial -y'| | |
|drupal_drush_config_export_command: |'csex -y'| | |
|drupal_files_folder_permissions: |'777'| | |
|drupal_private_folder_permissions: |'777'| | |
|drupal_sites_default_folder_permissions: |'777'| | |
|drupal_extra_envs: |''| | |
|drupal_liveness_probe: |true| | |
|drupal_hash_salt: |'4f041a096d1e36706d472a50b7316a2c'| | |
|drupal_settings_php  | See "Drupal settings"|To create the settings.php file | |
|drupal_settings_postgres_php  | See "Drupal settings"|To create the settings.php file | |
|drush_path: |/opt/drupal/vendor/bin/drush| | |
|install_path: |/opt/drupal/web/sites| | |
|stat_file_path: |/opt/drupal/web/sites/default/files/install.log| | |
|aws_access_key: |minio| | |
|aws_secret_access_key: |minio123| | |
|files_pvc: |default| | |
|files_pvc_size: |250M| | |
|files_accessmode: |ReadWriteMany| | |
|minio_client_config_dir: |/opt/drupal/.mc/| | |
|db_pvc: |default| | |
|db_pvc_size: |250M| | |
|db_container_port: |3306| | |
|db_port: |3306| | |
|drupal_profile: |standard| | |
|drupal_import_database: |false| | |
|drupal_database_backup_path: |''| | |
|drupal_db_import_force: |false| | |
|drupal_do_not_install: |false| | |
|drupal_always_install: |false| | |
|tmp_dir: |/tmp| | |
|drupal_drush_post_install_command: |false| | |
|drupal_drush_locale_update: |false| | |
|drupal_annotations: |''| | |
|drupal_labels: |''| | |
|drupal_files_backup_path: |''| | |
|drupal_import_files: |false| | |
|drupal_translations_path: |'translations'| | |
|fluentd: |false| | |
|drupal_promtail: |true|Use promtail, if you don't want to use promtail, set this to false |Needs a configmap to exist, see "Using promtail" |
|promtail_image: |grafana/promtail:main|Image for promtail |Used to tail logs |
|drupal_use_serviceaccount: |false| | |
|drupal_serviceaccount: |''|To use with environments which require a service account (Istio etc.) |You need to create this yourselves, the operator doesn't create it for you. |
|drupal_post_start_commands | {{ drush_path }} cr && {{ drush_path }} {{ drupal_drush_config_import_command }}  | | |
|drupal_init |See "Drupal init" | | |
|drupal_startup |See "Drupal startup" | | |
|drupal_php_ini |See "Drupal PHP ini" | | |
|drupal_log_dir |/var/log/drupal |To set log dir | |
|deployment_custom_annotations |'' |Annotations to add to deployments |Usage: bar/at.domain.com: foo |
|fluentd_drupal_log_dir |/var/log/drupal |To set log dir for fluentd sidecar |*DEPRECATED* |
|fluentd_drupal_config |See "Fluentd config" | |*DEPRECATED* |
|fluentd_image |ozziio/fluentd-elasticsearch:1.11 | |*DEPRECATED* |
|fluentd_conf_value |fluentd-drupal.conf | |*DEPRECATED* |

## Drupal settings

### drupal_settings_php

Default value:

```yaml
drupal_settings_php: |-
      <?php
      $settings['container_yamls'][] = DRUPAL_ROOT . '/sites/default/services.yml';
      $config['system.performance']['css']['preprocess'] = '{{ drupal_config_system_performance_css_preprocess }}';
      $config['system.performance']['js']['preprocess'] = '{{ drupal_config_system_performance_js_preprocess }}';
      $databases['default']['default'] = [
        'database' => getenv('MYSQL_DATABASE'),
        'username' => getenv('MYSQL_USER'),
        'password' => getenv('MYSQL_PASSWORD'),
        'prefix' => '{{ drupal_db_prefix }}',
        'host' => '{{ ansible_operator_meta.name }}-db',
        'port' => '{{ drupal_db_port }}',
        'namespace' => '{{ drupal_db_namespace }}',
        'driver' => '{{ drupal_db_driver }}',
      ];
      $settings['hash_salt'] = '{{ drupal_hash_salt }}';
      $settings['trusted_host_patterns'] = ['{{ trusted_host_patterns | default('^.+$', true) }}'];
      $config['locale.settings']['translation']['path'] = '{{ drupal_translation_path }}';
      {{ drupal_extra_config }}

```

### drupal_settings_postgres_php

```yaml
drupal_settings_postgres_php: |-
      <?php
      $settings['container_yamls'][] = DRUPAL_ROOT . '/sites/default/services.yml';
      $config['system.performance']['css']['preprocess'] = '{{ drupal_config_system_performance_css_preprocess }}';
      $config['system.performance']['js']['preprocess'] = '{{ drupal_config_system_performance_js_preprocess }}';
      $databases['default']['default'] = [
        'database' => getenv('POSTGRES_DATABASE'),
        'username' => getenv('POSTGRES_USER'),
        'password' => getenv('POSTGRES_PASSWORD'),
        'host' => '{{ ansible_operator_meta.name }}-postgres',
        'port' => '{{ postgres_container_port }}',
        'namespace' => '{{ postgres_namespace }}',
        'driver' => '{{ postgres_driver }}',
        'charset' => '{{ postgres_charset }}',
        'collation' => '{{ postgres_collation }}',
      ];
      $settings['hash_salt'] = '{{ drupal_hash_salt }}';
      $settings['trusted_host_patterns'] = ['{{ trusted_host_patterns | default('^.+$', true) }}'];
      $config['locale.settings']['translation']['path'] = '{{ drupal_translation_path }}';
      $settings["config_sync_directory"] = '../sync';
      {{ drupal_extra_config }}
```

## Drupal init

Default value:

```yaml
drupal_init: |-
  #!/bin/bash
  set -x
  while [ ! -f /scripts/settings.php ]; do sleep 1; done
  cp /scripts/settings.php "{{ install_path }}"/default/settings.php
  cp /scripts/settings.php /pre-scripts/settings.php;
  cp /scripts/startup.sh /pre-scripts/startup.sh
  mkdir -p "{{ install_path }}"/default/files
  pushd "{{ install_path }}"/default
  chown www-data:www-data -R files sync
  chmod 2"{{ drupal_files_folder_permissions }}" files sync
  chmod u+x /pre-scripts/startup.sh && /pre-scripts/startup.sh && echo "done"
```

## Drupal startup

Default value:

```yaml
drupal_startup: |-
  #!/bin/bash
  set -x
  error_exit() {
    echo "[ERROR] drupal_startup: ${1:-"Unknown Error"}" 1>&2
    exit 1
  }
  DRUSH="{{ drush_path }}"
  INSTALLPATH="{{ install_path }}"
  # Do NOT put quotes around false!!!1!
  STATFILE="{{ stat_file_path }}"
  DRUPAL_LOCALE="{{ drupal_locale }}"
  drupal_drush_update_database_command="{{ drupal_drush_update_database_command }}"
  drupal_drush_config_import_first_command="{{ drupal_drush_config_import_first_command }}"
  drupal_drush_config_import_command="{{ drupal_drush_config_import_command }}"
  drupal_drush_config_export_command="{{ drupal_drush_config_export_command }}"
  drupal_do_not_install="{{ drupal_do_not_install | default(false) | lower }}"
  drupal_config_split="{{ drupal_config_split | default(false) | lower }}"
  drupal_config_import="{{ drupal_config_import | default(true) | lower }}"
  do_db_import="{{ drupal_import_database | default(false) | lower }}"
  db_import_path="{{ drupal_database_backup_path | default('/tmp/db.sql') }}"
  drupal_db_import_force="{{ drupal_db_import_force | default(false) | lower }}"
  drupal_always_install="{{ drupal_always_install | default(false) | lower }}"
  drupal_drush_post_install_command="{{ drupal_drush_post_install_command | default(false) | lower }}"
  drupal_drush_locale_update="{{ drupal_drush_locale_update | default(false) | lower }}"
  do_files_import="{{ drupal_import_files | default(false) | lower }}"
  do_reset_admin="{{ drupal_reset_admin | default(false) | lower }}"
  pushd "{{ install_path }}"/default
  chown www-data:www-data -R files sync
  chmod 2775 files sync
  $DRUSH cr || true
  if [[ ("$drupal_always_install" == "true") ]];then
    echo ">> Removing $STATFILE"
    rm -f $STATFILE
    echo ">> [OK] Removed $STATFILE"
    ${DRUSH} sql-drop -y || error_exit "$LINENO: Could not drop db."
  fi
  if [[ ("$do_files_import" == "true") ]];then
      echo ">> Importing files"
      mc --config-dir '{{ minio_client_config_dir }}' mirror '{{ drupal_files_backup_path }}' '{{ install_path }}'/default/files || error_exit "$LINENO: Could not mirror files."
      pushd "{{ install_path }}"/default
      chown www-data:www-data -R files
      chmod 2775 files
      echo ">> [OK] Imported files"
  fi
  if [[ ("$drupal_do_not_install" == "true") ]];then
    echo ">> [OK] Not installing"
    exit 0
  fi
  if [[ (("$do_db_import" == "true") && ("$drupal_db_import_force" == "true")) ]]; then
      backup_name=`basename ${db_import_path}`
      mc --config-dir '{{ minio_client_config_dir }}' cp ${db_import_path} '{{ tmp_dir }}'/${backup_name} || error_exit "$LINENO: Could not download db dump."
      gzip -vt '{{ tmp_dir }}'/${backup_name}
      if [ $? = 0 ]; then
          echo ">> [OK] Unpacking gzip..."
          gunzip -c '{{ tmp_dir }}'/${backup_name} > '{{ tmp_dir }}'/db.sql || error_exit "$LINENO: Could not unzip '{{ tmp_dir }}'/${backup_name}"
      fi
      ${DRUSH} sql-drop -y || error_exit "$LINENO: Could not drop db."
      echo ">> [OK] Importing database from '{{ tmp_dir }}'/${backup_name}"
      ${DRUSH} sql-cli < '{{ tmp_dir }}'/db.sql
      $DRUSH cr
      touch $STATFILE && echo "drupal is installed" >> $STATFILE
  fi
  if [[ (("$do_db_import" == "true") && ( ! -e $STATFILE)) ]]; then
      backup_name=`basename ${db_import_path}`
      mc --config-dir '{{ minio_client_config_dir }}' cp ${db_import_path} '{{ tmp_dir }}'/${backup_name} || error_exit "$LINENO: Could not download db dump."
      gzip -vt '{{ tmp_dir }}'/${backup_name}
      if [ $? = 0 ]; then
          echo ">> [OK] Unpacking gzip..."
          gunzip -c '{{ tmp_dir }}'/${backup_name} > '{{ tmp_dir }}'/db.sql || error_exit "$LINENO: Could not unzip '{{ tmp_dir }}'/${backup_name}"
      fi
      ${DRUSH} sql-drop -y || error_exit "$LINENO: Could not drop db."
      echo ">> [OK] Importing database from '{{ tmp_dir }}'/${backup_name}"
      ${DRUSH} sql-cli < '{{ tmp_dir }}'/db.sql
      $DRUSH cr
      touch $STATFILE && echo "drupal is installed" >> $STATFILE
  fi
  if [[ ("$drupal_drush_locale_update" == "true") ]];then
    pushd "{{ install_path }}"/default
    echo ">> create translations directory if it does not exist"
    mkdir -p '{{ drupal_translations_path }}'
    chown www-data:www-data -R '{{ drupal_translations_path }}'
    chmod 2775 '{{ drupal_translations_path }}'
    ${DRUSH} locale-check && ${DRUSH} locale-update || error_exit "$LINENO: Could not update translations."
  fi
  $DRUSH status bootstrap | grep -q "Drupal bootstrap" &> /dev/null;
  if [ $? = 0 ];then
      echo ">> [OK] Drupal is already installed."
      $DRUSH ${drupal_drush_update_database_command}
      if [ "$drupal_config_split" == "false" ];then
        if [ "$drupal_config_import" == "true" ];then
          $DRUSH $drupal_drush_config_import_first_command
        fi
        $DRUSH cr
        echo "drupal is installed" >> $STATFILE
      else
        $DRUSH $drupal_drush_config_export_command $drupal_config_split
        if [ "$drupal_config_import" == "true" ];then
          $DRUSH $drupal_drush_config_import_first_command
        fi
        $DRUSH $drupal_drush_config_export_command $drupal_config_split
        if [ "$drupal_config_import" == "true" ];then
          $DRUSH $drupal_drush_config_import_command
        fi
        $DRUSH cr
        if [[ ("$drupal_drush_locale_update" == "true") ]];then
          pushd "{{ install_path }}"/default
          echo ">> create translations directory if it does not exist"
          mkdir -p '{{ drupal_translations_path }}'
          chown www-data:www-data -R '{{ drupal_translations_path }}'
          chmod 2775 '{{ drupal_translations_path }}'
          ${DRUSH} locale-check && ${DRUSH} locale-update || error_exit "$LINENO: Could not update translations."
        fi
      fi
  elif [[ (($? != 0) && ( ! -e $STATFILE)) ]];then
      echo ">> Creating $STATFILE"
      touch $STATFILE
      echo ">> [OK] Could not bootstrap Drupal, starting empty site-install"
      $DRUSH si '{{ drupal_profile }}' install_configure_form.enable_update_status_module=NULL \
        install_configure_form.enable_update_status_emails=NULL \
        --account-name=${DRUPAL_USER} --account-pass=${DRUPAL_PASSWORD} --locale=${DRUPAL_LOCALE} -y
      if [[ '{{drupal_set_uuid}}' == "true" ]];then
        $DRUSH config-set "system.site" uuid '{{drupal_uuid}}' -y
      fi
      if [ "$drupal_config_split" == false ];then
        if [ "$drupal_config_import" == "true" ];then
          $DRUSH $drupal_drush_config_import_first_command
          $DRUSH $drupal_drush_config_import_command
        fi
        echo "drupal is installed" >> $STATFILE
        if [ "$drupal_drush_post_install_command" != "false" ];then
          echo "running drush post install"
          $DRUSH $drupal_drush_post_install_command
        fi
      else
        if [ "$drupal_config_import" == "true" ];then
          $DRUSH $drupal_drush_config_import_first_command
        fi
        $DRUSH $drupal_drush_config_export_command $drupal_config_split
        if [ "$drupal_config_import" == "true" ];then
          $DRUSH $drupal_drush_config_import_command
        fi
        $DRUSH $drupal_drush_config_export_command $drupal_config_split
        if [ "$drupal_config_import" == "true" ];then
          $DRUSH $drupal_drush_config_import_command
        fi
        $DRUSH cr
        echo "drupal is installed" >> $STATFILE
        if [ "$drupal_drush_post_install_command" != "false" ];then
          echo "running drush post install"
          $DRUSH "$drupal_drush_post_install_command"
        fi
      fi
      if [[ ("$drupal_drush_locale_update" == "true") ]];then
        pushd "{{ install_path }}"/default
        echo ">> create translations directory if it does not exist"
        mkdir -p '{{ drupal_translations_path }}'
        chown www-data:www-data -R '{{ drupal_translations_path }}'
        chmod 2775 '{{ drupal_translations_path }}'
        ${DRUSH} locale-check && ${DRUSH} locale-update || error_exit "$LINENO: Could not update translations."
      fi
  else
    error_exit "$LINENO: Could not run config import nor site install."
  fi
  if [[ ("$do_reset_admin" == "true") ]];then
    ${DRUSH} upwd admin ${DRUPAL_PASSWORD} || error_exit "$LINENO: Could not reset admin pass."
  fi
```

## Drupal php ini

Default value:

```yaml
drupal_php_ini: |-
  post_max_size='{{ drupal_php_post_max_size }}';
  upload_max_filesize='{{ drupal_php_upload_max_filesize }}';
  memory_limit='{{ drupal_php_memory_limit }}';
```

## fluentd drupal config

```yaml
fluentd_drupal_config: |
  <source>
    @type tail
    format none
    path {{ fluentd_drupal_log_dir }}/drupal.log
    pos_file {{ fluentd_drupal_log_dir }}/drupal.log.pos
    tag drupal
    format /^\[(?<drupal_time>[^ ]*)\] *\[(?<level>[^ ]*)\] *\[location: (?<path>[^ ]*)\] \[channel: (?<channel>[^ ]*)\] \[client: (?<clientIP>[^ ]*)\] \[user: (?<user>[^ ]*)\]\s(?<message>.*)$/
  </source>
  <match drupal>
    @type elasticsearch
    host elasticsearch-master.logging.svc.cluster.local
    port 9200
    logstash_format true
  </match>
```

## Using promtail

The operator uses Promtail sidecar per default, to create the needed config map, you need something like this:

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
      - url: http://loki.monitoring.svc.cluster.local:3100/loki/api/v1/push
    scrape_configs:
      - job_name:  "drupal" 
        static_configs: 
          - targets: 
              - localhost 
            labels:
              app: "drupal"
              __path__: /var/log/drupal/*.log # Any file .log in the EmptyDir Volume.
```

`clients.url` need to be changed to where you have loki in your cluster.

To disable promtail sidecar, you need to set: `drupal_promtail: false`


## Extra envs

You can inject extra env. variables to drupal with:

```yaml
  drupal_extra_envs: |-
    - name: DRUPAL_EXTRA_ENV
      value: fooisbar
    - name: DRUPAL_EXTRA_NAMESPACE
      valueFrom:
        fieldRef:
          fieldPath: metadata.namespace
    - name: PASSWORD
      valueFrom:
        secretKeyRef:
          name: my-secrets
          key: password
```

