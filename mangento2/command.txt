#1 
mysqldump --single-transaction --add-drop-database -u USER -p"PASSWD" -P PORT_NUM -h HOST  DBNAME_PROD > bck/DBNAME_PROD.sql
#2
mysql -u USER -p"PASSWD" DBNAME_PREPROD < bck/DBNAME_PROD.sql
#3
rsync --delete -av /var/www/PROD/web/shared/pub/media/ pub/media
#4
redis-cli
select 0 / 1 / 2
flushdb
#5
php bin/magento config:set --scope=default  web/unsecure/base_url http://URL_PREPROD/
php bin/magento config:set --scope=default  web/secure/base_url http://URL_PREPROD/
php bin/magento config:set --scope=default  payment/adyen_abstract/demo_mode 1
php bin/magento config:set --scope=default  dev/js/merge_files 0
php bin/magento config:set --scope=default  dev/css/merge_css_files 0
php bin/magento config:set --scope=websites --scope-code=base_w2  web/unsecure/base_url http://URL_PREPROD_WEBSITE/
php bin/magento config:set --scope=websites --scope-code=base_w2  web/unsecure/base_link_url http://URL_PREPROD_WEBSITE/
php bin/magento config:set --scope=websites --scope-code=base_w2  web/secure/base_url http://URL_PREPROD_WEBSITE/
php bin/magento config:set --scope=websites --scope-code=base_w2  web/secure/base_link_url http://URL_PREPROD_WEBSITE/
#6
php bin/magento deploy:mode:set developer
#7
php -f bin/magento setup:static-content:deploy
#8
php -d memory_limit=-1 -d max_execution_time=0 bin/magento cache:clean
