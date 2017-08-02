`nginx:alpine`-based docker image for Friendica. EXPERIMENTAL

Start command:

    docker run -e SMTP_HOST=smtp.host -e SMTP_USER=smtp_user -e SMTP_PASS=smtp_pass -e SERVER_NAME=servername -p 8080:80 -d --name friendica friendica

If you need SSL for SMTP (eg. gmail):

    docker run -e SMTP_SSL=y -e SMTP_HOST=smtp.host -e SMTP_USER=smtp_user -e SMTP_PASS=smtp_pass -e SMTP_PORT=465 -e SERVER_NAME=servername -p 8080:80 -d --name friendica friendica

Note that Friendica needs to use HTTP standard ports (80 / 443). For SSL/TLS, use a front-end server (like Apache) to terminate TLS connections and forward requests to docker container as HTTP.

Variables:
* `SERVER_NAME`: host name (used in URLs) - mandatory
* `SMTP_HOST`: SMTP server hostname - mandatory
* `SMTP_PORT`: SMTP server port - mandatory
* `SMTP_USER`: SMTP username - mandatory
* `SMTP_PASS`: SMTP password - mandatory
* `SMTP_SSL`: set to nonempty if you need to use SSL/TLS for SMTP (**not** STARTTLS)

## TODO

* Documentation
* ???
