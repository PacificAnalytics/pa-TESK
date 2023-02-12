# Deployment instructions for TESK

## 00 Prerequisities 
We assume you have installed
- docker
- helm
- ubuntu wsl

and you are running a minikube cluster on windows host machine.

## 01 Start Service on windows machine

### start docker

start minikube with docker-driver and expose port 31567 (nodeport - see values.yml)
```
minikube start --driver=docker --ports=31567:31567
```

### create secrets
create secrets.yaml in charts/tesk with following content for a basic startup of the application:
```
ftp:
  username: <username>
  password: <password>

auth:
  client_id: <client_id>
  client_secret: <client_secret>
```

### Install Tesk via Helm
go to charts/tesk
```
cd charts/tesk
```

install tesk:
windows command line / powershell
```
helm upgrade --install tesk-release . -f secrets.yaml -f values.yaml
```

or:

install on namespace "tesk" (at current stage not neccessary) -  will only work if you set up the namespace via kubectl
```
helm upgrade --install tesk-release . -f secrets.yaml -f values.yaml -n tesk
```

confirm port-forwarding:
```
docker port minikube
```

output should show (along your other open ports):
`31567/tcp -> 0.0.0.0:31567`



create clusterrole and binding (otherwise there will be an error "cannot create ressource"):
```
kubectl create clusterrolebinding taskmaster --clusterrole cluster-admin --serviceaccount=default:taskmaster
```

get reachable ip:
on windows machine run:

```
ipconfig
```
get IPv4-Adresse from Ethernet-Adapter vEthernet (WSL).
copy that ip and insert it in the url request below.


You should be able to see an empty list of tasks by calling
```
http://vEthernet_WSL_IPv4:31567/v1/tasks

{
  "tasks" : [ ]
}

```


--> you can now head over to 02_pa-tesk-tasks.md for testing the tes functionality


- current:
cwl-tes can reach the service.
test recognizes the request and starts jobs.
jobs are not executed correctly -> error: UnicodeDecodeError: "'utf-8' codec can't decode byte 0x8b in position 1: invalid start byte"
minikube addons enable ingress
minikube dashboard