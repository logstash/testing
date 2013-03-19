# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu-12.10-amd64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://vagrant-jls.objects.dreamhost.com/ubuntu-12.10-amd64.box"

  config.vm.forward_port 5601, 5601
  config.vm.forward_port 9200, 9200
  config.vm.forward_port 5001, 5001

  config.vm.provision :puppet, :module_path => "modules"  do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
  end
end
