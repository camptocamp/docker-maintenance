#!/bin/sh

cp /app/index.html ./index.html

sed --in-place "s/{{title}}/${TITLE}/g" index.html
sed --in-place "s/{{headline}}/${HEADLINE}/g" index.html
sed --in-place "s/{{message}}/${MESSAGE}/g" index.html

while true
do
    { printf "HTTP/1.1 %s\r\n" "${RESPONSE_CODE}"; cat index.html; } | nc -lvp "${PORT}"
done
