# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/23 13:27:53 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/30 12:48:15 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories
EXPOSE 80
EXPOSE 443

RUN apk update 
RUN apk add nginx && \
    mkdir /run/nginx
RUN apk add openrc supervisor telegraf
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /www
RUN apk add curl
RUN apk add openssl;
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/index.html /www/index.html
COPY ./srcs/supervisord.conf /etc/
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/stop.sh /tmp/
RUN chmod +x /tmp/stop.sh
CMD supervisord -c /etc/supervisord.conf