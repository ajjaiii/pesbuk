FROM ajjaiii/php-mysql
RUN cd /var/www/html/ && rm -Rf *
COPY . /var/www/html/
RUN apt update
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apache2ctl" ]
CMD [ "-D", "FOREGROUND" ]
