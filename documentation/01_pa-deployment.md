# Deployment instructions for TESK


start docker

start minikube with docker-driver and expose port 31567 (nodeport - see values.yml)
```
minikube start --driver=docker --ports=31567:31567
```



go to charts/tesk
```
cd charts/tesk
```

install tesk via helm:
```
helm upgrade --install tesk-release . -f secrets.yaml -f values.yaml
```

create clusterrole and binding:
```
kubectl create clusterrolebinding taskmaster --clusterrole cluster-admin --serviceaccount=default:taskmaster
```


install on namespace "tesk" (at current stage not neccessary) -  will only work if you set up the namespace via kubectl
```
helm upgrade --install tesk-release . -f secrets.yaml -f values.yaml -n tesk
```

confirm port-forwarding:
```
docker port minikube
```

output should show (along your other open ports):
31567/tcp -> 0.0.0.0:31567


get reachable ip:
get IPv4-Adresse from Ethernet-Adapter vEthernet (WSL), on windows machine run:

```
ipconfig
```


You should be able to see an empty list of tasks by calling
```
http://vEthernet_WSL_IPv4:31567/v1/tasks

{
  "tasks" : [ ]
}

```

minikube addons enable ingress
minikube dashboard