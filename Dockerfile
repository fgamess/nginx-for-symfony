FROM nginx

MAINTAINER Franck GAMESS <xxxxxxx@xxxx.com>

RUN apt-get update && apt-get install -y \
    vim

ADD nginx.conf /etc/nginx/
RUN mkdir /etc/nginx/sites-available
ADD conf.d/http.conf /etc/nginx/conf.d/
ADD upstream.conf /etc/nginx/site-available/
RUN rm /etc/nginx/conf.d/default.conf
# ADD site.conf /etc/nginx/sites-available/
# RUN ln -s /etc/nginx/sites-available/file_consumer /etc/nginx/sites-enabled/file_consumer

RUN usermod -u 1000 www-data

EXPOSE 80 443
