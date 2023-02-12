# Test instructions for TESK

## 0 Requisities
-> pa-tesk deployed via helm/minikube/docker on windows machine with exposed port on 31567 (see 01_pa-deployment.md)
-> postman installed and configured


## 1 Tesk Tasks via Repo
### 1.1 Setup URL
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


## 1.5 Check Cluster Logs
run
```
minikube dashboard
```
and go to "jobs". here you should have a list of running jobs.  see logs for details.


## 2 Troubleshooting

### JSON Unicode Error UTF-8
UnicodeDecodeError: 'utf-8' codec can't decode byte 0x8b in position 1: invalid start byte

-> will not work via cwl-tes
-> will not work via tesk scripts
-> will not work via postman


-->> WHY?


## Scripts not working on windows powershell, need to use ubuntu wsl