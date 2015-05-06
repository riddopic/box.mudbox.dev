#!/bin/bash -eux

echo 'Use local cache mirror of Yum repos for speedup...'
rm -f /etc/yum.repos.d/*

cat <<EOF > /etc/yum.repos.d/centos.repo
[base]
name=CentOS-$releasever - Base
baseurl=http://yum.mudbox.dev/centos/$releasever/os/$basearch
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever
sslverify=true

[extras]
name=CentOS-$releasever - Extras
baseurl=http://yum.mudbox.dev/centos/$releasever/extras/$basearch
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever
sslverify=true

[updates]
name=CentOS-$releasever - Updates
baseurl=http://yum.mudbox.dev/centos/$releasever/updates/$basearch
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever
sslverify=true
EOF

cat <<EOF > /etc/yum.repos.d/chef_stable.repo
[chef_stable]
name=chef_stable
baseurl=https://packagecloud.io/chef/stable/el/6/$basearch
repo_gpgcheck=1
gpgcheck=0
enabled=1
gpgkey=https://packagecloud.io/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt

[chef_stable-source]
name=chef_stable-source
baseurl=https://packagecloud.io/chef/stable/el/6/SRPMS
repo_gpgcheck=1
gpgcheck=0
enabled=1
gpgkey=https://packagecloud.io/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

cat <<EOF > /etc/yum.repos.d/epel.repo
[epel]
name=Extra Packages for Enterprise Linux 6 - $basearch
baseurl=http://yum.mudbox.dev/fedora-epel/$releasever/$basearch
enabled=1
gpgcheck=1
gpgkey=http://yum.mudbox.dev/fedora-epel/RPM-GPG-KEY-EPEL-$releasever
sslverify=true
EOF
