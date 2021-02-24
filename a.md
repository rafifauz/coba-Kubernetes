Kubectl create secret generic cilsy-nodejs-secret ---from-file=.env

### Secret via Text
Kubectl create secret generic cilsy-nodejs-secret --from-literal=DB_user=root

### Secret via File


#### echo -n "devopscilsy" |base64
ZGV2b3BzY2lsc3kK
#### echo -n "1234567890" |base64
MTIzNDU2Nzg5MAo=
#### echo -n "dbsosmed" |base64
ZGJzb3NtZWQK
#### echo -n "kube-pesbuk.ccybmikezpmc.ap-southeast-1.rds.amazonaws.com" |base64
a3ViZS1wZXNidWsuY2N5Ym1pa2V6cG1jLmFwLXNvdXRoZWFzdC0xLnJkcy5hbWF6b25hd3MuY29tCg==

   DB_USER: ZGV2b3BzY2lsc3k=
   DB_PASS: MTIzNDU2Nzg5MA==
   DB_HOST: a3ViZS1wZXNidWsuY2N5Ym1pa2V6cG1jLmFwLXNvdXRoZWFzdC0xLnJkcy5hbWF6b25hd3MuY29t
   DB_NAMA: ZGJzb3NtZWQ=


