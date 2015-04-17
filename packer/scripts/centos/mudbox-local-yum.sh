#!/bin/bash -eux

echo 'Use local cache mirror of Yum repos for speedup...'
rm -f /etc/yum.repos.d/*
curl http://yum.mudbox.dev/centos/base.repo -o /etc/yum.repos.d/base.repo
curl http://yum.mudbox.dev/centos/epel.repo -o /etc/yum.repos.d/epel.repo
