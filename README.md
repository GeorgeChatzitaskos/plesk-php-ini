# :globe_with_meridians: PHP Configuration Script 

This script `configure_php.sh` modifies the `php.ini` files for all installed PHP versions on a Plesk server to optimize performance for WordPress sites.

---

## :rocket: Usage 

1. **Download the script:**

    ```bash
    wget https://github.com/GeorgeChatzitaskos/raw/main/plesk-php-ini.sh
    ```

2. **Make the script executable:**

    ```bash
    chmod +x configure_php.sh
    ```

3. **Run the script as root:**

    ```bash
    sudo ./configure_php.sh
    ```

---

## :bulb: What does this script do? 

This script makes changes to PHP settings like `max_execution_time`, `memory_limit`, `post_max_size`, `upload_max_filesize`, `max_input_vars`, and various `opcache` settings. A backup of the original `php.ini` file is created before any changes are applied.

---

## :warning: Disclaimer 

Always test scripts in a non-production environment first. Monitor your server's performance and error logs after making changes. Adjust as necessary based on your specific circumstances.

