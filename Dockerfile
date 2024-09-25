FROM ubuntu:24.04

RUN --mount=type=cache,target=/var/lib/apt/lists \
    --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/root/.cache \
  apt-get update && \
  apt-get upgrade && \
  apt-get install --yes --no-install-recommends netcat

COPY index.html /app/index.html
COPY entrypoint.sh /usr/bin/entrypoint.sh

ENV PORT=80 \
    RESPONSE_CODE=200 \
    TITLE="Maintenance" \
    HEADLINE="Maintenance" \
    MESSAGE="This application is in maintenance mode"

CMD ["/usr/bin/entrypoint.sh"]
