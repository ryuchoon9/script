#!/bin/bash
  
# Hostname 출력
hostname=$(hostname)
echo "Hostname : $hostname"

# CPU 정보 출력
cpu_info=$(lscpu -p | egrep -v '^#' | sort -u -t, -k 2,4 | wc -l)
echo "CPU info: $cpu_info"

# 메모리 정보 출력
memory_info=$(grep -i "MemTotal" /proc/meminfo | awk '{printf "%.0f\n", $2/1024/1024}')
echo "memory info: $memory_info"

# 디스크 정보 출력
default_disk=$(lsblk --output NAME,MOUNTPOINT -nl | awk '$2=="/" {print $1}')
disk_info=$(lsblk --output SIZE -nb "/dev/$default_disk" | awk '{printf "%.0f\n", $1/1024/1024/1024}')
echo "disk info: $disk_info"

# 운영체제 정보 출력
release=$(lsb_release -ds)
echo "release: $release"

#Public IP
public_IP=$(wget -qO- ifconfig.me)
echo "public ip: $public_IP"

#LoadBalancer IP
LoadBalancer_IP=$(dig +short shryu-test-lb-17159337-e9c48d0e671c.kr.lb.naverncp.com)
echo "LoadBalancer IP: $LoadBalancer_IP"
