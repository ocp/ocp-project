# ; -*- mode: dockerfile;-*-
# vim: set ft=dockerfile:
ARG IAMLIVE=1.1.27
ARG TERRAFORM=1.14.0
ARG TERRAGRUNT=0.93.11

FROM ghcr.io/iann0036/iamlive:${IAMLIVE} AS iamlive
FROM hashicorp/terraform:${TERRAFORM} AS terraform
FROM gruntwork/terragrunt:${TERRAGRUNT} AS terragrunt

FROM debian:trixie-slim AS tf
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        awscli \
        bash \
        git \
        jq \
        procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY --from=iamlive /usr/local/iamlive /usr/local/bin/iamlive
COPY --from=terraform /usr/local/terraform /usr/local/bin/terraform
COPY --from=terragrunt /usr/local/terragrunt /usr/local/bin/terragrunt
WORKDIR /opt/tf
ENV TF_CLI_CONFIG_FILE=/opt/tf/.terraformrc
COPY ./src/scripts/entrypoint.deploy.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
