`nginx:alpine`-based docker image for Friendica. EXPERIMENTAL

Start command:

    docker run -e SMTP_HOST=smtp.host -e SMTP_USER=smtp_user -e SMTP_PASS=smtp_pass -p 8080:80 -d --name friendica friendica

If you need SSL for SMTP (eg. gmail):

    docker run -e SMTP_SSL=y -e SMTP_HOST=smtp.host -e SMTP_USER=smtp_user -e SMTP_PASS=smtp_pass -e SMTP_PORT=465 -p 8080:80 -d --name friendica friendica

Note that Friendica needs to use HTTP standard port (80). For SSL/TLS, use a front-end server (like Apache) to terminate TLS connections and forward requests to docker container as HTTP.

## TODO

* Documentation
* ???
