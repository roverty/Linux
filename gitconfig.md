# Git configuration and uselful flags

[TOC]

## Useful global configurations

### Text editor

`git --global core.editor vim`

### Cache credentials

Esta opción permite guardar temporalmente las credenciales del usuario para no ponerlas a cada rato. Se debe inferir a que solo funciona con repositorio que usa HTTPS

* `git config --global credential.helper cache # Set git to use the credential memory cache`
* `git config --global credential.helper 'cache --timeout=3600' # Set the cache to timeout after 1 hour (setting is in seconds)`

## Useful combinations

### Graph with log

`git log --all --decorate --oneline --graph`