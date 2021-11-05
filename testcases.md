# Test cases for the Drupal Operator

Usage: Copy this file and mark the tests as done for yourself.

Tests that can be done with [molecule](./molecule) should be done there of course.
So we don't need to test that ConfigMaps are working etc.

These are the more complex tests.

## The operator itself

Do this test in an empty environment (no Drupal deploys) _and_ in an environment with already existing Drupal deploys.
Check that other Drupal deploys are not affected negatively or restarted, and that they are "visible" to the operator.
Also check in different namespaces!

### Empty environment

- [ ] The operator can be deployed and starts up correctly (the myname-controller-manager pod)
    - [ ] Check the ansible logs
    - [ ] Check CPU activity – it should be very low while no sites are created
    - [ ] The CustomResource has been created

### Non-empty environment

- [ ] The operator can be deployed and starts up correctly (the myname-controller-manager pod)
    - [ ] Check the ansible logs
    - [ ] Check CPU activity – it should be very low while no sites are created
    - [ ] The CustomResource has been created

### A new API version of the CRD

- [ ] Check that it can co-exist with the previous version

## A Drupal deployment

- [ ] Drupal pod & database starts up correctly


### Database import scenarios (on start up, Drupal not installed)

#### drupal_import_database: true && gzipped backup

- [ ] Check the initDrupal container logs, it should import and unzip the db that you have specified under drupal_database_backup_path

#### drupal_import_database: true

- [ ] Check the initDrupal container logs, it should import the db that you have specified under drupal_database_backup_path

#### drupal_import_database unset

- [ ] Do not include the drupal_import_database setting at all (uncomment or remove). Pod should start up and not import a db.

#### drupal_import_database: false

- [ ] Set the drupal_import_database setting to false or anything else than true. Pod should start up and not import a db.

### Database import scenarios (on start up, Drupal already installed)

#### drupal_import_database unset

- [ ] Do not include the drupal_import_database setting at all (uncomment or remove). Pod should start up and *not import a db*.

#### drupal_import_database: false

- [ ] Set the drupal_import_database setting to false or anything else than true. Pod should start up and *not import a db*.

## New operator, but it listens on the same ozzi.io/v1alpha2 version

### Have a running deployment on the old operator

#### Start the new operator

- [x ] Make sure database is still up – *Observation: DB pod is restarted, but DB (volume) is kept. Might cause downtime.*
- [x ] Make sure site is still up

#### Stop the old operator

- [ x] Make sure database is still up
- [ x] Make sure site is still up