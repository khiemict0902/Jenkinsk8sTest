FROM nginx:latest 

ENV HTTP_PROXY=http://10.26.2.55:8080 
ENV HTTPS_PROXY=http://10.26.2.55:8080 
ENV no_proxy=localhost,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.0.0/16,127.0.0.0/8 

COPY ./src /usr/share/nginx/html 
WORKDIR /usr/share/nginx/html 

EXPOSE 80
