# WordPress on Ubuntu 20.04 LOMP
This playbook will install a WordPress website on top of a LOMP environment (Linux, OpenLiteSpeed, MySQL and PHP) on an Ubuntu machine. A virtualhost will be created with the options specified in the vars/default.yml variable file.

## Settings
- `php_modules`:  An array containing PHP extensions that should be installed to support your WordPress setup. You don't need to change this variable, but you might want to include new extensions to the list if your specific setup requires it.
- `mysql_root_password`: The desired password for the **root** MySQL account.
- `mysql_db`: The name of the MySQL database that should be created for WordPress.
- `mysql_user`: The name of the MySQL user that should be created for WordPress.
- `mysql_password`: The password for the new MySQL user.
- `http_host`: Your domain name.
- `http_conf`: The name of the configuration file that will be created within OpenLiteSpeed.
- `http_port`: HTTP port for this virtual host, where `80` is the default. 
- `https_port`: HTTPS port for this virtual host, where `443` is the default. 

## Running this Playbook
### Install Ansible
1. Install ansible on center server
```
apt update && apt install ansible -y
```
2. Add SSH key to the client server so center server can ssh in without password
### Obtain the playbook
Download the git repo
```
git clone https://github.com/Code-Egg/ansible-lomp-wp.git
cd ansible-lomp-wp
```
### Customize Options
Update `example.com` from inventory to your client server's domain/IP
```
vim inventory
```

Update SQL, Domain, Port from vars/default.yml
```
vim vars/default.yml
```
```yml
---
#System Settings
php_modules: [ 'lsphp74-curl', 'lsphp74-imagick', 'lsphp74-intl', 'lsphp74-opcache', 'lsphp74-redis', 'lsphp74-memcached', 'lsphp74-tidy' ]
owner: www-data
group: www-data

#MySQL Settings
mysql_root_password: "mysql_root_password"
mysql_db: "wordpress"
mysql_user: "egguser"
mysql_password: "password"

#HTTP Settings
http_host: "your_domain"
http_port: "80"
https_port: "443"
```
### Run ansible playbook
```command
ansible-playbook playbook.yml
```