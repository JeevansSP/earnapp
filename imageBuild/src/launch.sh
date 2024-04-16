#!/bin/bash


rm /etc/redsocks.conf

cp /app/redsocks.conf /etc/redsocks.conf
# Perform replacements using sed
echo $proxy_ip $proxy_port $proxy_user $proxy_password
sed -i "s/\${proxy_ip}/$proxy_ip/g" /etc/redsocks.conf
sed -i "s/\${proxy_port}/$proxy_port/g" /etc/redsocks.conf
sed -i "s/\${proxy_user}/$proxy_user/g" /etc/redsocks.conf
sed -i "s/\${proxy_password}/$proxy_password/g" /etc/redsocks.conf


redsocks -c /etc/redsocks.conf 


# Mimic hostnamectl
echo "Mimicking hostnamectl"

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



echo "Installing earnapp"


wget -qO- https://brightdata.com/static/earnapp/install.sh > /tmp/earnapp.sh


echo "running earnapp"

echo "yes" | bash /tmp/earnapp.sh 

echo $(earnapp status)

read $something