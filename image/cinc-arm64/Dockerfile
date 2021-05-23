FROM ubuntu:20.04 AS build

ARG VERSION=17.1.35

RUN apt-get update \
  && apt-get install --no-install-recommends -y ca-certificates curl \
  && curl -o /tmp/cinc.deb -L http://downloads.cinc.sh/files/stable/cinc/${VERSION}/ubuntu/20.04/cinc_${VERSION}-1_arm64.deb \
  && apt-get install -y /tmp/cinc.deb \
  && rm -f /tmp/cinc.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp*

VOLUME ["/opt/cinc"]
