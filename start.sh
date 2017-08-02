#!/bin/sh

echo "[www]" > /etc/php5/conf.d/sendmail.ini
if [ "${SMTP_SSL}" == "y" ]; then
    echo "sendmail_path = \"/usr/sbin/sendmail -H 'exec openssl s_client -quiet -tls1 -connect ${SMTP_HOST}:${SMTP_PORT}' -au${SMTP_USER} -ap${SMTP_PASS} -t -i\"" >> /etc/php5/conf.d/sendmail.ini
else
    echo "sendmail_path = \"/usr/sbin/sendmail -S ${SMTP_HOST}:${SMTP_PORT} -au${SMTP_USER} -ap${SMTP_PASS} -t -i\"" >> /etc/php5/conf.d/sendmail.ini
fi

sed -i "s/localhost/${SERVER_NAME}/g" /etc/nginx/conf.d/default.conf
crond -b
/usr/bin/php-fpm5
nginx -c /etc/nginx/nginx.conf
tail -f /var/log/php-fpm.log
