# ; -*- mode: dockerfile;-*-
# vim: set ft=dockerfile:

# Must be declared at global scope.
ARG IAMLIVE=1.1.27
ARG TERRAFORM=1.14.0
ARG TERRAGRUNT=0.93.11

FROM ghcr.io/iann0036/iamlive:${IAMLIVE} AS iamlive
FROM hashicorp/terraform:${TERRAFORM} AS terraform

FROM debian:bookworm-slim AS terragrunt
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl && \
    apt-get clean
ARG TARGETARCH
RUN curl -Lo \
  ./terragrunt \
  https://github.com/gruntwork-io/terragrunt/releases/download/$TERRAGRUNT/terragrunt_$(uname)_$TARGETARCH
RUN chmod +x terragrunt
RUN mv terragrunt /usr/local/bin/terragrunt

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
COPY --from=iamlive /usr/local/bin/iamlive /usr/local/bin/iamlive
COPY --from=terraform /usr/local/bin/terraform /usr/local/bin/terraform
COPY --from=terragrunt /usr/local/bin/terragrunt /usr/local/bin/terragrunt
WORKDIR /opt/tf
ENV TF_CLI_CONFIG_FILE=/opt/tf/.terraformrc
COPY ./src/scripts/entrypoint.deploy.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
