#!/bin/bash

VAULT_VERSION=1.16.2

# Сборка
docker buildx build --output type=docker --progress=plain \
  --build-arg="VAULT_VERSION=$VAULT_VERSION" \
  -f Dockerfile -t coralhl/vault:latest -t coralhl/vault:$VAULT_VERSION .
# Заливка в регистр
docker push coralhl/vault:latest
docker push coralhl/vault:$VAULT_VERSION
