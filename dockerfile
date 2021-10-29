FROM --platform=linux/arm64 debian:buster
#FROM --platform=linux/amd64 debian:buster
WORKDIR /var/www/html/code
RUN apt update && apt install -y apache2 apache2-dev libapache2-mod-wsgi-py3 python3 python3-flask
COPY flask.conf /etc/apache2/sites-available/
#COPY ports.conf /etc/apache2
RUN rm /var/log/apache2/access.log && ln -s /dev/stdout /var/log/apache2/access.log
RUN rm /var/log/apache2/error.log && ln -s /dev/stderr /var/log/apache2/error.log
RUN rm /var/log/apache2/other_vhost_access.log ; ln -s /dev/stdout /var/log/apache2/other_vhost_access.log
RUN a2ensite flask
RUN a2dissite 000-default
#RUN pip install flask
#CMD ["python", "app.py"]
CMD ["apachectl", "-D", "FOREGROUND"]

