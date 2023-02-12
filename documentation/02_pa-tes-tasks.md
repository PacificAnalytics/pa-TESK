# Test instructions for TESK

## 0 Requisities
-> pa-tesk deployed via helm/minikube/docker on windows machine with exposed port on 31567 (see 01_pa-deployment.md)
-> postman installed and configured


## 1 Tesk Tasks via Repo
### 1.1 Configuration
configure `examples/taskList` and `examples/taskCreate` by replacing the URL by the URL from your cluster (IPv4 Ethernet WSL) -> `ipconfig` on windows host machine


### 1.2 List Tasks
in project root directory:
ubuntu wsl

```
./examples/taskList 
```
-> should give you an http 200 response
-> if it throws an error, try dos2unix ./examples/taskList and run the script again



### 1.3 Create Tasks
in project root directory:
ubuntu wsl

```
./examples/taskCreate examples/success/hello.json
```
-> if it throws an error, try dos2unix ./examples/taskList and run the script again

### 1.4 Show Task
```
curl <baseurl:port>/v1/tasks/<task-name>
```



## 2 Tesk Tasks via curl

### 2.1 List Tasks 
### 2.2 Create Task
in project root folder:

```
curl.exe -H 'Content-Type: application/json' --data  '@examples/success/stdout.json' -X POST 'http://172.19.128.1:31567/v1/tasks'
```


### 2.3 Show Task



## 3 Tesk Tasks via Postman

### 3.1 Configuration
imort collection

from /examples import GA4GH.postman_collection.json into postman

change your base url in the requests




##  4 Minikube
## 4.1 Check minikube Cluster Logs
run
```
minikube dashboard
```
and go to "jobs". here you should have a list of running jobs.  see logs for details.


## 5 Troubleshooting

### 5.1 JSON Unicode Error UTF-8
UnicodeDecodeError: 'utf-8' codec can't decode byte 0x8b in position 1: invalid start byte

-> will not work via cwl-tes
-> will not work via tesk scripts
-> will not work via postman


-->> WHY?


### Scripts not working on windows powershell, need to use ubuntu wsl