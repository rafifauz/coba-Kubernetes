sudo snap install helm --classic
ln -s /snap/bin/helm /usr/local/bin/helm
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.14.3/cert-manager.crds.yaml
kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager --namespace cert-manager --version v0.14.3 jetstack/cert-manager
kubectl get pods --namespace cert-manager



apiVersion: v1
kind: Namespace
metadata:
  name: pesbuk-ns

---
apiVersion: cert-manager.io/v1alpha2
kind: Issuer
metadata:
 name: pesbuk-prod
 namespace: pesbuk-ns
spec:
 acme:
   # The ACME server URL
   server: https://acme-v02.api.letsencrypt.org/directory
   # Email address used for ACME registration
   email: kerupuk.lovers@gmail.com
   # Name of a secret used to store the ACME account private key
   privateKeySecretRef:
     name: pesbuk-prod
   # Enable the HTTP-01 challenge provider
   solvers:
   - selector: {}
     http01:
       ingress:
         class:  nginx
