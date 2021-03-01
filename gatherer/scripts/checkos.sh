#!/bin/bash
set +x
if [ "$(cat /etc/redhat-release | grep 'CentOS Linux release 8'  )" ]; then
    echo "safe"
else
    echo "Not safe, not running on Centos 8, exiting and raising error."
    exit 1
fi
