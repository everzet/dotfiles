#!/bin/sh

USER=$(whoami)
APACHE_USER=$(ps axho user,comm|grep -E "httpd|apache"|uniq|grep -v "root"|awk 'END {print $1}')

chcache () {
    sudo chmod +a "$USER allow delete,write,append,file_inherit,directory_inherit" $1
    sudo chmod +a "$APACHE_USER allow delete,write,append,file_inherit,directory_inherit" $1

    echo "- $1 has been properly chmod'ed for $USER and $APACHE_USER"
}

# symfony 1.4
if [ -d cache ]; then chcache "cache"; fi
if [ -d logs ];  then chcache "logs"; fi

# Symfony2
if [ -d app/cache ];   then chcache "app/cache"; fi
if [ -d app/logs ];    then chcache "app/logs"; fi
if [ -d web/uploads ]; then chcache "web/uploads"; fi
if [ -d web/media ];   then chcache "web/media"; fi
