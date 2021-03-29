# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/23 13:29:00 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/29 15:56:14 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories
RUN apk update 
RUN apk add nginx && \
    mkdir /run/nginx
RUN apk add openrc supervisor telegraf
RUN apk add phpmyadmin
RUN apk add php7-fpm
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /www

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/supervisord.conf /etc/

EXPOSE  5000
RUN  cd /www &&\
         wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz &&\
         rm phpMyAdmin-5.0.2-all-languages.tar.gz &&\
          mv phpMyAdmin-5.0.2-all-languages phpmyadmin && \
        rm /www/phpmyadmin/config.sample.inc.php
COPY ./srcs/config.inc.php  /www/phpmyadmin/
COPY ./srcs/telegraf.conf /etc/telegraf.conf

CMD supervisord -c /etc/supervisord.conf
