FROM ubuntu:20.04 AS build

ENV SHELLCHECK_VERSION 0.7.2
ENV SHELLCHECK_SHA256 70423609f27b504d6c0c47e340f33652aea975e45f312324f2dbf91c95a3b188

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
  && apt-get install --no-install-recommends -y ca-certificates curl xz-utils \
  && rm -rf /var/lib/apt/lists/* \
  && curl -o "shellcheck.tar.xz" -L "https://github.com/koalaman/shellcheck/releases/download/v${SHELLCHECK_VERSION}/shellcheck-v${SHELLCHECK_VERSION}.linux.x86_64.tar.xz" \
  && echo "${SHELLCHECK_SHA256} *shellcheck.tar.xz" | sha256sum --check --strict \
  && tar xvf shellcheck.tar.xz --strip-components=1 -C /usr/local/bin \
  && chmod +x /usr/local/bin/shellcheck

FROM scratch
COPY --from=build /usr/local/bin/shellcheck /bin/
CMD ["/bin/shellcheck"]
