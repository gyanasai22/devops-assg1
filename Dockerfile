FROM ubuntu:18.04
 RUN apt-get update -y
 RUN apt-get install -y software-properties-common
 RUN add-apt-repository -y ppa:nginx/stable
 RUN apt-get update -y
 RUN apt-get install -y nginx
 EXPOSE 80 443
 COPY . /usr/share/nginx/html
 ADD ./default.conf /etc/nginx/conf.d/default.conf
 ADD ./cert/server.crt /etc/nginx/certs/server.crt
 ADD ./cert/server.key /etc/nginx/certs/server.key
 WORKDIR /etc/nginx
CMD ["nginx", "-g", "daemon off;"]
