# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/28 02:36:20 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/21 15:43:21 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update 
RUN apk add nginx
RUN apk add openrc
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/index.html /www/index.html
# CMD sh ./setup.sh
# COPY srcs/setup.sh ./setup.sh
EXPOSE 80
EXPOSE 443
RUN mkdir -p /run/nginx
RUN apk add curl
RUN apk add openssl;
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
# COPY srcs/default.conf /etc/nginx/conf.d/default.conf
CMD /bin/sh
# CMD ["nginx", "-g", "daemon off;"]