FLIS Services Docker
=====================

This repo contains the orchestration setup for flis services. After successfully setting it up, it will expose a webserver that will serve:
* /flip - https://github.com/eea/flis.flip
* /live-catalogue - https://github.com/eea/flis.live-catalogue
* /hstool - https://github.com/eea/flis.horizon-scanning-tool
* /metadata - https://github.com/eea/flis.metadata

A PREFIX and a SERVER_NAME can be configured for different deployments.

Please check the env folder for a complete list of the variables that can be configured.

Prerequisites - System packages
-------------------------------

These packages must be installed : Docker, docker-compose. The docker
compose configuration is hosted in a different repo.
