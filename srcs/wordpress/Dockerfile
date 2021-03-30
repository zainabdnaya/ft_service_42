# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/23 13:28:00 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/30 12:49:13 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

EXPOSE 5050

RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories
RUN apk update 
RUN apk add nginx && \
    mkdir /run/nginx
RUN apk add openrc supervisor telegraf
RUN apk add php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add php7-fpm
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /www

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/supervisord.conf /etc/
RUN  cd /www &&\
    wget http://wordpress.org/latest.tar.gz &&\
    tar -xzvf latest.tar.gz &&\
    rm latest.tar.gz wordpress/wp-config-sample.php
COPY ./srcs/wp-config.php  /www/wordpress/
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/stop.sh /tmp/
RUN chmod +x /tmp/stop.sh
CMD supervisord -c /etc/supervisord.conf