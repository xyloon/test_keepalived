#!/bin/bash

# $1 ==> MASTER, SLAVE
# $2 ==> 1 ~ 255
# $3 ==> 110 ?
# $4 ==> IP address of interface
# $5 ==> VIP

interface_name=$(netstat -ie | grep -B1 "$4" | head -n1 | awk '{print $1}' | sed 's/://')

echo "vrrp_instance VI_1 {"           > /etc/keepalived/keepalived.conf
echo "    state $1"                  >> /etc/keepalived/keepalived.conf
echo "    interface $interface_name" >> /etc/keepalived/keepalived.conf
echo "    virtual_router_id $2"      >> /etc/keepalived/keepalived.conf
echo "    priority $3"               >> /etc/keepalived/keepalived.conf
echo "    virtual_ipaddress {"       >> /etc/keepalived/keepalived.conf
echo "        $5"                    >> /etc/keepalived/keepalived.conf
echo "    }"                         >> /etc/keepalived/keepalived.conf
echo "    nopreempt"                 >> /etc/keepalived/keepalived.conf
echo "}"                             >> /etc/keepalived/keepalived.conf