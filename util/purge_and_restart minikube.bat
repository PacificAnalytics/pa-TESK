minikube delete --all --purge
minikube start --driver=docker --ports=31567:31567,80:80
minikube addons enable metrics-server