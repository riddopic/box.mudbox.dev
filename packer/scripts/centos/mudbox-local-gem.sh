#!/bin/bash -eux

echo 'Use local cache mirror of rubygems.org for speedup...'
cat <<EOF > /root/.gemrc
---
:backtrace: false
:bulk_threshold: 1000
:sources:
- http://gems.dev:9292
:update_sources: true
:verbose: true
install: "--no-rdoc --no-ri"
update: "--no-rdoc --no-ri"
benchmark: false
gem: "--no-ri --no-rdoc"
EOF
echo "set -o vi" >> /root/.bashrc
