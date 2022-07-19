# PHP FPM Container for Nextcloud

This container is one of my personal little things to enable the deployment of nextcloud in Kubernetes.
This repo automatically updates based on the latest version of the official PHP-FPM container, updates it and adds the required and recommended extensions to it to work with nextcloud.

## Installing

You can get this image by pulling `ghcr.io/justSem/nextcloud-php-fpm:latest`

This project offers three tagged versions:

`nightly` is the automatically built version based on the latest `php-fpm` image - beware that this image may present incompatibilities with current nextCloud versions as the build is not checked for proper functionality.

`latest` is the latest manually created build.

`stable` is the latest _semver_ tagged build (i.e. `v1.0.1`). This build has been tested to work correctly against the latest stable Nextcloud at the time of the build.


## Kubernetes deployment notes:
PHP-FPM is set to scale it's workers automatically - so be sure to set proper resource limits to prevent it from gobbling up your node's resources.
