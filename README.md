# coba-Kubernetes

Kubectl, KOPS 

## kubectl -> API Server -> ETCD -> API Server (sudah ada Tidak) > kalau tidak ada, buat baru

alias  k="kubectl"

minikube status

k- create -f namespace.yaml
kubectl apply -f depolyment.yaml

kubectl get pods -n kube-system
## Cheatsheet ( https://miro.medium.com/max/3296/0*ZN7R20r0cpCG3los )
minikube version
minikube start
echo $(minikube ip)
curl $(minikube ip):$NODE_PORT 
---------------------------------------------------------------------
kubectl get all
kubectl version
kubectl cluster-info
kubectl get nodes  #show all working node/vm
kubectl get pods
kubectl get services #show service IP that connect pods IP 
kubectl logs $POD_NAME
kubectl exec -it $POD_NAME bash
curl localhost:8080 #Run this after run exec and get open port using " cat server.js "

---------------------------------------------------------------------
## KUBERNETES DEPLOYMENT
kubectl describe deployment

### show all deploy (mirip docker ps)
```
kubectl get deployments 
```
### Karena pods pada kubernetes private maka butuh proxy
```
kubectl proxy 
```
### Deployment app (mirip docker run)
```
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
```
### Melihat pods/service yg berjalan pada suatu Deployment app (mirip docker run)
```
kubectl get pods -l run=kubernetes-bootcamp
```
```
kubectl get services -l run=kubernetes-bootcamp
```
---------------------------------------------------------------------
## KUBERNETES PODS

### Cara akses pod
```
POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
```
```
curl http://localhost:8001/api/v1/namespaces/default/pods/POD_NAME/proxy/
```
---------------------------------------------------------------------
## KUBERNETES SERVICE
### Service IP is connect pods IP even on diferent node
```
kubectl get services 
```

### Make service (mirip ip table)
```
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
```
Hasil : 
NAME                  TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
kubernetes-bootcamp   NodePort    10.103.92.172   <none>        8080:32300/TCP   2s

### Cara akses service
```
NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
```
### Delete service
```
kubectl delete service -l run=kubernetes-bootcamp
```

---------------------------------------------------------------------
## KUBERNETES LABEL
kubectl describe pods $POD_NAME

### Memberikan label kepada Pod
```
kubectl label pod $POD_NAME app=v1
```
---------------------------------------------------------------------

## KUBERNETES REPLICA-SET
kubectl get rs
---------------------------------------------------------------------


========================================================================================================
## Kubernetes Sceduller 
### 1. Filtering Node: Difilter node terbaik
### 2. Ranking Node: Kemudian diranking  berdasarkan Resource (sisa resource dan jumlah pod yang ada) 
Resource :
 		Resource limit (minimal) & Request Limit (Maksimum) (contoh: CPU 1000MI & RAM 1000Mim)

##Kubernetes Controller Manager
### 1. Deployment Controller
### 2. Namespace Controller
### 3. Endpoint
### 4. Cronjob
### 5. PV Controller
### 6. Service Account Controller
### 7. Statefulset
### 8. Replicaset
### 9. Node Controller
	     Akan melakukan beberapa step pengecekan Node	
		> Node Controller Check : 5 detik
		> Monitor Grace Period : 40 detik
		> Pod Eviction Timeout : 5 Menit
		Jika resource Node tidak sesuai pod yg dibuat maka Pod Pending
### 10. PV Binder Controller
### 11. Replication Controller

========================================================================================================

