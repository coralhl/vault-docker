# base image
FROM alpine:3.19

# set vault version
ARG VAULT_VERSION
ENV VAULT_VERSION=$VAULT_VERSION

# create a new directory
RUN mkdir -p /vault/config /vault/data  

# download dependencies
RUN apk --no-cache add \
    bash \
    ca-certificates \
    curl \
    tzdata \
    wget

# download and set up vault
RUN wget --output-document=/tmp/vault.zip \
    https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip /tmp/vault.zip -d /vault && \
    rm -f /tmp/vault.zip && \
    chmod +x /vault

# update PATH
ENV PATH="PATH=$PATH:$PWD/vault"

# add the config file
COPY ./vault-config.json /vault/config/vault-config.json

# expose port 8200
EXPOSE 8200

# run vault
ENTRYPOINT ["vault"]
