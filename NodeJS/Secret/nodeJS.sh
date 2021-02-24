#scp -i /home/ubuntu/Your_KEY.pem ./* ubuntu@54.169.70.116:~/nodejs_API
#scp -i /home/raxer/Raxer/Cilsy/CilsyAWS.pem ./* ubuntu@52.221.213.79:~/nodeJS
sudo apt update
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

node --version
npm -v

#npm adalah package manager nodeJS
npm init

#modul di nodeJS (Contoh: Mysql, Express[framew rk nodeJS] & body-Parser)
npm install --save express mysql body-parser

#Atur Database
sudo apt install mysql-server -y

sudo mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS nodejs_api;
USE nodejs_api;
CREATE TABLE IF NOT EXISTS person (
id int(11) NOT NULL AUTO_INCREMENT,
first_name varchar(50) NOT NULL DEFAULT '0',
last_name varchar(50) NOT NULL DEFAULT '0',
PRIMARY KEY (id)
);
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '<password>';
FLUSH PRIVILEGES;
EOF

#show databases;
#use nodejs_api;
#show tables;

#node server.js


