FROM ubuntu:20.04 AS build

RUN apt-get update \
  && apt-get install --no-install-recommends -y ca-certificates curl xz-utils \
  && rm -rf /var/lib/apt/lists/* \
  && curl -o /usr/local/bin/hadolint -L https://github.com/hadolint/hadolint/releases/download/v2.4.1/hadolint-Linux-x86_64 \
  && chmod +x /usr/local/bin/hadolint

FROM scratch
COPY --from=build /usr/local/bin/hadolint /bin/
CMD ["/bin/hadolint", "-"]
