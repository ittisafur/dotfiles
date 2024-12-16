function usephp() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: usephp <php-version>"
        return 1
    fi
    PHP_VERSION=$1

    # Update CLI PHP Version
    sudo update-alternatives --set php /usr/bin/php$PHP_VERSION || {
        echo "Error: PHP $PHP_VERSION is not installed for CLI"
        return 1
    }

    # Update Apache2 PHP Version
    sudo a2dismod "php*" >/dev/null 2>&1
    sudo a2enmod "php$PHP_VERSION" >/dev/null 2>&1 || {
        echo "Error: PHP $PHP_VERSION module is not available for Apache2"
        return 1
    }
    sudo systemctl restart apache2 || {
        echo "Error: Failed to restart Apache2"
        return 1
    }
    echo "Switched to PHP $PHP_VERSION"
}
