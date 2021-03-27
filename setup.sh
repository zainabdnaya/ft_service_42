#!/bin/bash

minikube start
eval $(minikube -p minikube docker-env)

echo " ============ BUILDING IMAGES ============ "
docker build -t nginx:service nginx/
docker build -t phpmyadmin:service phpmyadmin/
docker build -t wordpress:service wordpress/
docker build -t mysql:service ./mysql
docker build -t ftps:service ./ftps
echo " ============ KUBERNETES ============ "
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f yaml/metallb.yaml
kubectl apply -f yaml/nginx.yaml
kubectl apply -f yaml/nginx_service.yaml
kubectl apply -f yaml/php.yaml
kubectl apply -f yaml/php_service.yaml
kubectl apply -f yaml/wordpress.yaml
kubectl apply -f yaml/wordpress_service.yaml
kubectl apply -f yaml/mysql.yaml
kubectl apply -f yaml/mysql_service.yaml
kubectl apply -f yaml/ftps.yaml
kubectl apply -f yaml/ftps_service.yaml

