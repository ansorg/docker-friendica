#!/bin/sh

echo "[www]" > /etc/php5/fpm.d/sendmail.conf
if [ "${SMTP_SSL}" == "y" ]; then
    echo "php_admin_value[sendmail_path] = /usr/sbin/sendmail -H 'exec openssl s_client -quiet -tls1 -connect ${SMTP_HOST}:${SMTP_PORT}' -au${SMTP_USER} -ap${SMTP_PASS} -t -i" >> /etc/php5/fpm.d/sendmail.conf
else
    echo "php_admin_value[sendmail_path] = /usr/sbin/sendmail -S ${SMTP_HOST}:${SMTP_PORT} -au${SMTP_USER} -ap${SMTP_PASS} -t -i" >> /etc/php5/fpm.d/sendmail.conf
fi

crond -b
/usr/bin/php-fpm5
nginx -c /etc/nginx/nginx.conf
tail -f /var/log/php-fpm.log
