# -*- mode: ruby -*-
# vi: set ft=ruby :

def vm(config, name, *roles)
  roles << name
  config.vm.define name do |m|
    m.vm.host_name = name

    #m.vm.provision :shell, :inline => "apt-get update"
    #m.vm.provision :shell, :inline => "apt-get upgrade -y"
    m.vm.provision :puppet, :module_path => "modules" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "site.pp"

      puppet.facter = {}
      ENV.each do |key, value|
        next unless key =~ /^FACTER_/
        puppet.facter[key.gsub(/^FACTER_/, "")] = value
      end
      puppet.facter["roles"] = roles.join(",")
    end
  end
end

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu-12.10-amd64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://vagrant-jls.objects.dreamhost.com/ubuntu-12.10-amd64.box"

  vm(config, "redis")
end
