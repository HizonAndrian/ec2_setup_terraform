#!/bin/bash

# This script is used to bootstrap the development environment for the project.

sudo apt update -y
sudo apt install nginx -y

sudo sh -c "cat > /var/www/html/index.nginx-debian.html" <<EOF
<h1>Hello from Andrian</h1>
<p>This is my first web page.</p>
EOF