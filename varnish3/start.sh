#!/usr/bin/env bash
varnishd -a :80 -T localhost:6082 -f /etc/varnish/default.vcl -s malloc,256m -p shm_reclen=4084
varnishncsa # varnish log in Apache / NCSA combined log format
