minikube delete
minikube start --driver=docker --ports=31567:31567,80:80,443:443
minikube addons enable metrics-server
helm upgrade --install tesk-release ..\charts\tesk\. -f ..\charts\tesk\secrets.yaml -f ..\charts\tesk\values.yaml