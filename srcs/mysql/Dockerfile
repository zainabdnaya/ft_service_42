# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/26 12:53:45 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/30 10:20:59 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM  alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories
RUN apk update 
RUN apk add openrc supervisor telegraf
COPY ./srcs/supervisord.conf /etc/
EXPOSE 3306
RUN chmod -R  777 /lib/rc/sh
RUN apk add mysql mysql-client
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/stop.sh /tmp/
RUN chmod +x /tmp/stop.sh
COPY srcs/set.sh ./
CMD  sh ./set.sh