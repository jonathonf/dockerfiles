#!/bin/sh

if [ -z "$FPM_PORT_9000" ]; then
    sed -i "/ConnectTo /c ConnectTo = $FPM_PORT_9000_TCP_ADDR:$FPM_PORT_9000_TCP_PORT" /etc/hiawatha/hiawatha.conf
fi

exec /usr/sbin/hiawatha -d
