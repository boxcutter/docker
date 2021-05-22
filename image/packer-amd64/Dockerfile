FROM ubuntu:20.04 AS build

ENV PACKER_VERSION 1.7.2
ENV PACKER_SHA256 9429c3a6f80b406dbddb9b30a4e468aeac59ab6ae4d09618c8d70c4f4188442e

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
  && curl -o "packer.zip" "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" \  
  && echo "${PACKER_SHA256} *packer.zip" | sha256sum --check --strict \
  && unzip packer.zip -d "/usr/local/bin" \
  && chmod +x /usr/local/bin/packer \
  && rm -rf /var/lib/apt/lists/*

FROM ubuntu:20.04

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local/bin/packer /usr/local/bin/packer
CMD ["packer", "--help"]
