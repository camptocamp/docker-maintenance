FROM ubuntu:24.04

RUN --mount=type=cache,target=/var/lib/apt/lists \
    --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/root/.cache \
  apt-get update && \
  apt-get upgrade --yes && \
  apt-get install --yes --no-install-recommends netcat-openbsd

COPY index.html /app/index.html
COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN mkdir /data && \
    chmod go+w /data
WORKDIR /data

ENV PORT=8080 \
    RESPONSE_CODE="503 Service Unavailable" \
    TITLE=Maintenance \
    HEADLINE=Maintenance \
    MESSAGE="This application is in maintenance mode"

CMD ["/usr/bin/entrypoint.sh"]
