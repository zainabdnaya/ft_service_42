# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/26 12:53:45 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/26 12:53:47 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM  alpine:3.12

RUN apk update 
RUN apk add openrc supervisor
COPY ./srcs/supervisord.conf /etc/
EXPOSE 3306
RUN chmod -R  777 /lib/rc/sh
RUN apk add mysql mysql-client

COPY srcs/set.sh ./
CMD  sh ./set.sh