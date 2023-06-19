#!/bin/sh

sudo podman pull registry.do180.lab:5000/httpd

sudo podman run -d \
        --name reg-httpd \
        -p 8080:80 \
        -v /web:/usr/local/apache2/htdocs \
        registry.do180.lab:5000/httpd

sudo semanage fcontext -a -t container_file_t /web
sudo semanage fcontext -a -t container_file_t /web/index.html
sudo restorecon /web
sudo restorecon /web/index.html

sudo podman generate systemd reg-httpd | sudo tee -a /usr/lib/systemd/system/reg-httpd.service

sudo systemctl daemon-reload
sudo systemctl restart reg-httpd