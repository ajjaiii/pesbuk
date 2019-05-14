FROM ajjaiii/php-mysql
RUN cd /var/www/html/ && rm -Rf *
VOLUME cilsy2:/var/www/html/
COPY . /var/www/html/
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apache2ctl" ]
CMD [ "-D", "FOREGROUND" ]
