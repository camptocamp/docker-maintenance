#!/bin/sh

{ \
    echo "HTTP/1.1 ${RESPONSE_CODE}"; \
    echo 'Content-Type: text/html; charset=UTF-8'; \
    echo 'Connection: close'; \
    echo; \
    cat /app/index.html; \
} > index.html

sed --in-place "s/{{title}}/${TITLE}/g" index.html
sed --in-place "s/{{headline}}/${HEADLINE}/g" index.html
sed --in-place "s/{{message}}/${MESSAGE}/g" index.html

while true
do
    nc -nlp "${PORT}" -w 0 < index.html
done
