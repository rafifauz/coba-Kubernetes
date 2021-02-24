git clone https://github.com/sdcilsy/landing-page.git

# sudo apt update
# sudo apt install nginx -y
# sudo apt install mysql-server -y
# sudo apt install php-fpm -y

# echo "----------------Setting Nginx---------------"
# sudo tee /etc/nginx/sites-available/web_baru <<EOL
# server {
# 	listen 80;
# 	#bisa diganti dengan ip address localhostmu atau ip servermu, nanti kalau sudah ada domain diganti nama domainmu
# 	server_name localhost;
# 	#root adalah tempat dmn codingannya di masukkan index.html dll.
# 	root /var/www/web_baru;
	
# 	# Add index.php to the list if you are using PHP
# 	index index.html index.htm ;

# 	location / {
# 	    try_files \$uri \$uri/ =404;
# 	}

# 	location ~ \.php$ {
# 	    include snippets/fastcgi-php.conf;
# 	    fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
# 	 }

# 	location ~ /\.ht {
# 	    deny all;
# 	}
# }
# sudo ln -s /etc/nginx/sites-available/web_baru /etc/nginx/sites-enabled
# sudo unlink /etc/nginx/sites-enabled/default

# cp ./landing-page/ /var/www/html/
# sudo nginx -t
# sudo systemctl restart nginx

