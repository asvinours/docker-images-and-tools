#!/usr/bin/env bash
varnishd -F -a :80 -T localhost:6082 -f /etc/varnish/default.vcl -s malloc,256m -p vcc_allow_inline_c=on -p shm_reclen=4084
