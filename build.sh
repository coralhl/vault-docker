#!/bin/bash
tag_base="latest"

# Сборка
docker buildx build --output type=docker --progress=plain \
  --build-arg="VAULT_VERSION=1.16.2" \
  -f Dockerfile -t coralhl/vault:$tag_base -t coralhl/vault:1.16.2 .
# Заливка в регистр
docker push coralhl/vault:$tag_base
docker push coralhl/vault:1.16.2
