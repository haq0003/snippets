RewriteEngine On
RewriteCond %{HTTP_HOST} ^XXXXX.fr$ [OR]
RewriteCond %{HTTP_HOST} ^www.XXXXX.fr$
RewriteRule (.*)$ http://YYY..XXXXX.fr/$1 [R=301,L]

HTTPS :

RewriteCond %{SERVER_PORT} 80
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301] 
