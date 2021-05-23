FROM ubuntu:20.04 AS build

ARG VERSION=4.37.17

RUN apt-get update \
  && apt-get install -y locales \
  && locale-gen en_US.UTF-8 \
  && update-locale LANG=en_US.UTF-8 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp*

ENV LANG=en_US.UTF-8 \
  LANGUAGE=en_US:en \
  LC_ALL=en_US.UTF-8

RUN mkdir -p /share

RUN apt-get update \
  && apt-get install --no-install-recommends -y ca-certificates curl \
  && curl -o /tmp/cinc-auditor.deb -L http://downloads.cinc.sh/files/stable/cinc-auditor/${VERSION}/ubuntu/20.04/cinc-auditor_${VERSION}-1_arm64.deb \
  && apt-get install -y /tmp/cinc-auditor.deb \
  && rm -f /tmp/cinc-auditor.deb

# Install any packages that make life easier for a cinc-auditor installation
RUN apt-get install -y git

ENTRYPOINT ["cinc-auditor"]
CMD ["help"]
VOLUME ["/share"]
WORKDIR /share
