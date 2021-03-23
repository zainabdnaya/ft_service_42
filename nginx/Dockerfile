# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zdnaya <zdnaya@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/23 13:27:53 by zdnaya            #+#    #+#              #
#    Updated: 2021/03/23 13:27:54 by zdnaya           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

# RUN apk add --no-cache openssh \
#     && sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config \
#     && echo 'root:0000' | chpasswd \
#     && ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
#     && ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
#     && echo "Port 30022" >> /etc/ssh/sshd_config \
#     && mkdir -p /var/run/sshd

# CMD ["/usr/sbin/sshd"]
# CMD ["nginx","-g", "daemon off;"]

# FROM alpine:latest

RUN apk update 
RUN apk add nginx
RUN apk add openrc
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/index.html /www/index.html
EXPOSE 80
EXPOSE 443
RUN mkdir -p /run/nginx
RUN apk add curl
RUN apk add openssl;
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
COPY srcs/setup.sh ./
CMD sh setup.sh
# CMD ["nginx", "-g", "daemon off;"]
