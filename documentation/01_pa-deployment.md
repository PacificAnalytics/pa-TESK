# Deployment instructions for TESK


start docker

start minikube with docker-driver and expose port 31567 (nodeport - see values.yml)
```
minikube start --driver=docker --ports=31567:31567
```

confirm port-forwarding:
```
docker port minikube
```

output should show (along your other open ports):
31567/tcp -> 0.0.0.0:31567


go to charts/tesk
```
cd charts/tesk
```

install testk via helm:
```
helm upgrade --install tesk-release . -f secrets.yaml -f values.yaml
```

install on namespane "tesk" (at current stage not neccessary) -  will only work if you set up the namespace via kubectl
```
helm upgrade --install tesk-release . -f secrets.yaml -f values.yaml -n tesk
```

get reachable ip:
get IPv4-Adresse from Ethernet-Adapter vEthernet (WSL), on windows machine run:

```
ipconfig
```

note:

```
minikube ip
``` 
will not output an ip which is not directly accessible

