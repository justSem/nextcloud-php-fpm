# PHP FPM Container for Nextcloud

This container is one of my personal little things to enable the deployment of nextcloud in Kubernetes.
This repo automatically updates based on the latest version of the official PHP-FPM container, updates it and adds the required and recommended extensions to it to work with nextcloud.

## Kubernetes deployment notes:
PHP-FPM is set to scale it's workers automatically - so be sure to set proper resource limits to prevent it from gobbling up your node's resources.
