FROM ajjaiii/php-mysql
COPY . /var/www/html/
RUN apt update
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apache2ctl" ]
CMD [ "-D", "FOREGROUND" ]
