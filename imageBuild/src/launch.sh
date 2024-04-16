#!/bin/bash



# Perform replacements using sed
echo $proxy_ip $proxy_port $proxy_user $proxy_password
sed -i "s/\${proxy_ip}/$PROXY_IP/g" /etc/redsocks.conf
sed -i "s/\${proxy_port}/$PROXY_PORT/g" /etc/redsocks.conf
sed -i "s/\${proxy_user}/$PROXY_USER/g" /etc/redsocks.conf
sed -i "s/\${proxy_password}/$PROXY_PASSWORD/g" /etc/redsocks.conf

# Restart the redsocks service
/etc/init.d/redsocks restart

# Mimic hostnamectl
echo "Mimicking hostnamectl"
hostnamectl_content='#!/bin/bash

# Get the hostname
hostname=$(hostname)

# Get the static hostname
static_hostname=$(cat /etc/hostname 2>/dev/null)

# Get the operating system
operating_system=$(lsb_release -d -s 2>/dev/null)

# Get the kernel version
kernel_version=$(uname -r)

# Print the information
echo "Static hostname: $static_hostname"
echo "Operating system: $operating_system"
echo "Kernel version: $kernel_version"
echo "Architecture: $(uname -m)"
echo "Shell: $SHELL"
'
hostnamectl_content='#!/bin/bash
echo $(uuidgen)
'

echo "$hostnamectl_content" > /usr/local/bin/hostnamectl
chmod +x /usr/local/bin/hostnamectl

echo $(hostnamectl)
# Setup iptables
echo "Setting up iptables"

iptables -t nat -N REDSOCKS
iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
iptables -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
iptables -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN

iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 12345

iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner root -j REDSOCKS 

iptables -t nat -A OUTPUT -p tcp --dport 443 -j REDSOCKS
iptables -t nat -A OUTPUT -p tcp --dport 9443 -j REDSOCKS
iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDSOCKS
iptables -t nat -A OUTPUT -p tcp --dport 8080 -j REDSOCKS
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDSOCKS
iptables -t nat -A PREROUTING -p tcp --dport 9443 -j REDSOCKS
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDSOCKS
iptables -t nat -A PREROUTING -p tcp --dport 8080 -j REDSOCKS



# run earnapp
# Install earnapp and start it
# cp /app/earnapp.sh /tmp/earnapp.sh
echo "Downloading earnapp"

wget -qO- https://brightdata.com/static/earnapp/install.sh > /tmp/earnapp.sh

echo "Installing earnapp"

echo "yes" | bash /tmp/earnapp.sh 

echo $(earnapp status)

read $something