#!/bin/bash

echo "Hello, World from $(hostname -f), DB address: ${db_address}, DB port: ${db_port}" > index.html

nohup busybox httpd -f -p 8080 &