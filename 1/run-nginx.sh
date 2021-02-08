minikube addons enable ingress
kubectl get pods -n kube-system

kubectl apply -f nginx-deployment.yaml
#karena port yg dibuka di file yaml 80
kubectl expose deployment web --type=NodePort --port=80
kubectl get service
#akses Nginx di local 
minikube service web --url