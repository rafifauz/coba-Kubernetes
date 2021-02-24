# INstall Ubuntu and nginx for pesbuk
FROM ubuntu:bionic
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y nginx php-fpm php-mysqli unzip systemd
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN sed -i -e "s/;\?daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.2/fpm/php-fpm.conf
RUN echo "clear_env = no" >> /etc/php/7.2/fpm/pool.d/www.conf
#nano etc/php/7.2/fpm/pool.d/www.conf
#env["NAME"] = $NAME
#export NAME = devopscilsy

#COPY FILE
COPY ./sosial-media-master/ /var/www/html/

# Nginx config
RUN rm /etc/nginx/sites-enabled/default
ADD ./web_baru /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/web_baru /etc/nginx/sites-enabled/

# RUN PHP and NGINX
CMD /etc/init.d/php7.2-fpm start && nginx

# Expose ports.
EXPOSE 80




