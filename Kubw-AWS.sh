sudo apt update

curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

sudo apt  install awscli
aws configure
ssh-keygen

tee ~/.basrc << EOF
export bucket_name=belajarlinux-states-stores
export KOPS_CLUSTER_NAME=kube.belajarlinux.web.id
export KOPS_STATE_STORE=s3://${bucket_name}
EOF

source .bashrc

kops create cluster --zones=ap-southeast-1a --node-count=3 --master-count=1 --node-size=t2.micro --master-size=t2.medium --name=${KOPS_CLUSTER_NAME} --ssh-public-key=~/.ssh/id_rsa.pub

kops update cluster --name ${KOPS_CLUSTER_NAME} --yes --admin

kops validate cluster

#kops delete cluster --name ${KOPS_CLUSTER_NAME} --yes 
