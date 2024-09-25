
#!/bin/sh

cp /app/index.html ./index.html

sed -i "s/{{title}}/$(echo ${TITLE})/g" index.html
sed -i "s/{{headline}}/$(echo ${HEADLINE})/g" index.html
sed -i "s/{{message}}/$(echo ${MESSAGE})/g" index.html

while true;  do {  echo -e "HTTP/1.1 ${RESPONSE_CODE}\r\n"; echo "$(cat index.html)"; } | nc -lvp  "$PORT";  done
