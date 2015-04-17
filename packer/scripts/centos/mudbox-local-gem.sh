#!/bin/bash -eux

echo 'Use local cache mirror of rubygems.org for speedup...'
/opt/chef/embedded/bin/gem sources -a http://gems.dev:9292
/opt/chef/embedded/bin/gem sources -r https://rubygems.org/
echo "set -o vi" >> /root/.bashrc
