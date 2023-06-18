# This is a solution for the nginx task
FROM centos:8

RUN yum install nginx -y

EXPOSE 80

COPY index.html /usr/share/nginx/html
COPY duffman.png /usr/share/nginx/html

CMD [ "nginx", "-g", "daemon off;" ]
