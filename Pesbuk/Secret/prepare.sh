#!/bin/bash
git clone https://github.com/rafifauz/SP1-Webserver-with-Nginx-Mysql.git
cp -r ./SP1-Webserver-with-Nginx-Mysql/sosial-media-master/ ./
rm -rf SP1-Webserver-with-Nginx-Mysql
#read -p "Enter Mysql Host: " MysqlHost
#mysql -h $MysqlHost -u devopscilsy -p dbsosmed < ./sosial-media-master/dump.sql

sudo tee ./sosial-media-master/config.php <<EOL 
<?php
\$db_host = getenv("DB_HOST");
\$db_user = getenv("DB_USER");
\$db_pass = getenv("DB_PASS");
\$db_name = getenv("DB_NAME");

try {    
    //create PDO connection 
    \$db = new PDO("mysql:host=\$db_host;dbname=\$db_name", \$db_user, \$db_pass);
} catch(PDOException \$e) {
    //show error
    die("Terjadi masalah: " . \$e->getMessage());
}

EOL

nano ./sosial-media-master/config.php
