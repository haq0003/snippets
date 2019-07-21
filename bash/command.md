Change conf value

sudo sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.0/fpm/php.ini
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/7.0/fpm/php.ini
sudo sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/7.0/fpm/php.ini
sudo sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/7.0/fpm/php.ini
