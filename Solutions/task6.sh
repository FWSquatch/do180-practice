#!/bin/bash

cp /dockerfiles/nginx/* .

cat > ./task6.dockerfile << EOF
# Edit this file to create an nginx webserver
# Pull from centos:8
FROM centos:8

# Extra fix needed, because the base URL for CentOS has changed.
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install nginx
RUN dnf clean all && dnf install -y nginx

# Publish port 80 to the outside world
EXPOSE 80

# Copy index.html and duffman.png into /usr/share/nginx/html directory
COPY index.html /usr/share/nginx/html/index.html
COPY duffman.png /usr/share/nginx/html/duffman.png

# Run the command 'nginx -g daemon off;'
ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g", "daemon off;"]
EOF

podman build -f ./task6.dockerfile -t registry.do180.lab:5000/duff-nginx:1.0 .

rm Dockerfile index.html duffman.png

podman push registry.do180.lab:5000/duff-nginx:1.0

podman run -d --name duffman \
        -p 8989:80 \
        registry.do180.lab:5000/duff-nginx:1.0

curl http://localhost:8989
