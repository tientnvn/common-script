#!/usr/bin/env bash

NAME=$1
DOMAIN=$2
PORT=$3
NGINX_FOLDER=/etc/nginx/sites-enabled

# Replace actual name, port, domain
sed -e "s/\${domain}/${DOMAIN}/" -e "s/\${port}/${PORT}/" -e "s/\${name}/${NAME}/" nginx_config_template.txt > ${NAME}

# Copy file to nginx folder
sudo cp ${NAME} ${NGINX_FOLDER}

# Reload nginx service
sudo service nginx reload

# Restart nginx service
sudo service nginx restart