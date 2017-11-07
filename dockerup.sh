#!/bin/bash
cd /var/www/html
rm tmp/pids/server.pid || true
mailcatcher --http-ip=0.0.0.0
wait-for-it -t 0 db:3306
rails db:setup
rails s
