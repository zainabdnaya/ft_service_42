# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/27 10:51:44 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/27 15:37:28 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update
RUN apk add vsftpd
RUN apk add openrc  supervisor
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/supervisord.conf /etc/
RUN echo -en "dnaya\ndnaya" | adduser zainab
RUN echo "zainab" | tee -a /etc/vsftpd.userlist
RUN apk add openssl;
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
CMD  supervisord -c /etc/supervisord.conf