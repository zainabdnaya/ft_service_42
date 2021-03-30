# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/29 10:39:58 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/30 11:44:41 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories
RUN apk update
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.10.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.10.linux-amd64.tar.gz
RUN apk add libc6-compat supervisor telegraf
WORKDIR /grafana-7.3.10
EXPOSE 3000
COPY ./srcs/supervisord.conf /etc/
COPY ./srcs/stop.sh /tmp/
RUN chmod +x /tmp/stop.sh
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/grafana.db /grafana-7.3.10/data/
CMD supervisord -c /etc/supervisord.conf