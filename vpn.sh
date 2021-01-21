#!/bin/sh

notify-send "Подключение к VPN, Закрытие предыдущей сессии..."
sudo kill -9 $(cat /var/run/vpnc/pid)
sudo vpnc work --pid-file /var/run/vpnc/pid

notify-send "Замена и добавление маршрутов, DNS-серверов..."
sudo ip route del default
sudo ip route add default via 192.168.1.1
sudo ip route add 10.0.0.0/8 dev tun0
sudo ip route add 109.194.0.0/16 dev tun0
sudo ip route add 5.3.3.0/24 dev tun0
sudo ip route add 188.186.157.0/24 dev tun0
sudo ip route add 212.33.232.0/24 dev tun0

sudo chmod o+w /etc/resolv.conf
echo "nameserver 10.101.0.1" > /etc/resolv.conf
echo "nameserver 10.101.0.2" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo "nameserver 192.168.1.1" >> /etc/resolv.conf
