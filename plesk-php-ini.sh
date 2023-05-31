#!/bin/bash

# Define an array with the paths to the PHP versions
php_versions=(/opt/plesk/php/*/)

for version in "${php_versions[@]}"; do
    # Path to the php.ini file for this PHP version
    ini_file="${version}etc/php.ini"

    # Check if the php.ini file exists
    if test -f "$ini_file"; then
        echo "Modifying $ini_file..."

        # Create a backup of the php.ini file
        cp "$ini_file" "$ini_file.bak"

        # Modify PHP settings for WordPress performance
        sed -i 's/^;*max_execution_time =.*/max_execution_time = 300/' "$ini_file"
        sed -i 's/^;*memory_limit =.*/memory_limit = 256M/' "$ini_file"
        sed -i 's/^;*post_max_size =.*/post_max_size = 64M/' "$ini_file"
        sed -i 's/^;*upload_max_filesize =.*/upload_max_filesize = 64M/' "$ini_file"
        sed -i 's/^;*max_input_vars =.*/max_input_vars = 3000/' "$ini_file"
        sed -i 's/^;*opcache.enable=.*/opcache.enable=1/' "$ini_file"
        sed -i 's/^;*opcache.memory_consumption=.*/opcache.memory_consumption=128/' "$ini_file"
        sed -i 's/^;*opcache.interned_strings_buffer=.*/opcache.interned_strings_buffer=8/' "$ini_file"
        sed -i 's/^;*opcache.max_accelerated_files=.*/opcache.max_accelerated_files=4000/' "$ini_file"
        sed -i 's/^;*opcache.revalidate_freq=.*/opcache.revalidate_freq=60/' "$ini_file"
        sed -i 's/^;*opcache.fast_shutdown=.*/opcache.fast_shutdown=1/' "$ini_file"
        echo "Modified $ini_file"
    else
        echo "php.ini file not found at $ini_file"
    fi
done
