# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/29 11:04:35 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/30 10:20:53 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories
RUN apk update
RUN apk add influxdb telegraf
RUN apk add supervisor
EXPOSE 8086
COPY ./srcs/supervisord.conf /etc/
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/stop.sh /tmp/
RUN chmod +x /tmp/stop.sh
# CMD /bin/sh
CMD supervisord -c /etc/supervisord.conf

