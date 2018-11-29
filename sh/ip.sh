
#!/usr/bin/env bash

# 获取电脑ip

net_dev=`ls /sys/class/net | grep -E '^(eth|wlan|enp|wlp)'`
ip=`ifconfig ${net_dev} | grep "inet " | awk '{print $2}'`

echo ${ip}
