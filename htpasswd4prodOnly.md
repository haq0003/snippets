SetEnvIf HOST "^www.xxxxxxxxx.fr$" prod_url

Order Deny,Allow

AuthType Basic
AuthName "Auth. Required"
AuthUserFile /home/xxxxxxxx/.htpasswd
Require valid-user
Deny from all
Allow from env=prod_url
Satisfy any

RewriteEngine On

RewriteCond %{SERVER_PORT} 80
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
