DOMAIN=$1
APACHE_FOLDER=/etc/apache2/sites-available
WWW_FOLDER=/var/www
WORDPRESS_ORIGINAL_FOLDER=${WWW_FOLDER}/wordpress
CONFIG_FILE=${DOMAIN}.conf
SCRIPT_FOLDER=/data/script/common-script

# Clone wordpress code
sudo cp -rf ${WORDPRESS_ORIGINAL_FOLDER} ${WWW_FOLDER}/${DOMAIN}

# Replace actual name, port, domain
sudo sed -e "s/\${domain}/${DOMAIN}/" ${SCRIPT_FOLDER}/apache_config_template.txt > ${APACHE_FOLDER}/${CONFIG_FILE}

# Enable the virtual host files that we created by typing
sudo a2ensite ${CONFIG_FILE}

# Restart apache2 service
sudo service apache2 reload