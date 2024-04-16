#!/bin/bash

echo "Downloading earnapp"
wget -qO- https://brightdata.com/static/earnapp/install.sh > /tmp/earnapp.sh
echo "yes" | bash /tmp/earnapp.sh 

earnapp stop 

