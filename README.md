
# Digital Packer Box

## Build Your Own Boxes

First, install [Packer](http://packer.io) and then clone this project.

Inside the `packer` directory, a JSON file describes each box that can be built.
You can use `packer build` to build the boxes.

    $ packer build centos-6.6-x86_64.json

If you want to use a another mirror site, use mirror variable.

    $ packer build -var 'mirror=http://iso-depot.mudbox.dev/' centos-6.6-x86_64.json

By default the Chef client is not installed on the machine, to install use the
Chef version variable.

	$ packer build -var 'chef_version=latest' ubuntu-14.04-amd64.json

If you only have VMware or VirtualBox available, you may also tell Packer to
build only that box.

    $ packer build -only=vmware-iso centos-6.6-x86_64.json

Congratulations! You now have box(es) in the ../builds directory that you can
then add to Vagrant.

### Proprietary Boxes

Red Hat Enterprise Linux templates are provided. However, their ISOs are not
publicly retrievable and as such, the URLs in those templates are bogus. For
RHEL you should substitute your server where you host the ISOs, using the mirror
variable as above.

### VMWare
If you're using the [Vagrant VMWare Fusion](https://www.vagrantup.com/vmware)
provider, using `vagrant box add --provider vmware_desktop ...` will work for
these boxes. Using `--provider vmware_fusion`, will not.

