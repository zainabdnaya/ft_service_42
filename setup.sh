#!/bin/bash

minikube start
eval $(minikube -p minikube docker-env)

echo " ============ BUILDING IMAGES ============ "
docker build -t nginx:service ./srcs/nginx/
# docker build -t ftps:service  ./srcs/ftps/
docker build -t wordpress:service ./srcs/wordpress/
docker build -t phpmyadmin:service ./srcs/phpmyadmin/
docker build -t mysql:service ./srcs/mysql/
# docker build -t grafana:service ./srcs/grafana/
# docker build -t influxdb:service ./srcs/influxdb/

echo " ============ KUBERNETES ============ "
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/yaml/metallb.yaml
kubectl apply -f srcs/yaml/mysql_pvc.yaml
kubectl apply -f srcs/yaml/influxdb_pvc.yaml
kubectl apply -f srcs/yaml/nginx.yaml
kubectl apply -f srcs/yaml/nginx_service.yaml
kubectl apply -f srcs/yaml/php.yaml
kubectl apply -f srcs/yaml/php_service.yaml
kubectl apply -f srcs/yaml/wordpress.yaml
kubectl apply -f srcs/yaml/wordpress_service.yaml
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/mysql_service.yaml
# kubectl apply -f srcs/yaml/ftps.yaml
# kubectl apply -f srcs/yaml/ftps_service.yaml
# kubectl apply -f srcs/yaml/grafana.yaml
# kubectl apply -f srcs/yaml/grafana_service.yaml
# kubectl apply -f srcs/yaml/influxdb.yaml
# kubectl apply -f srcs/yaml/influxdb_service.yaml

echo " ============ MINIKUBE DASHBOARD ============ "
minikube dashboard