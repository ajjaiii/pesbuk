FROM ubuntu:latest
RUN apt update
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install apache2 -y
RUN apt install php -y
RUN apt install php-mysql -y
RUN cd /var/www/html/ && rm -f index.html
COPY . /var/www/html/
RUN apt update
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apache2ctl" ]
CMD [ "-D", "FOREGROUND" ]
