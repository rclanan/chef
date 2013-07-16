# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  # This is the box name on your system.
  # You can list all of the available boxes by "vagrant box list"
  config.vm.box       = "precise64"

  # This is the URL to the Vagrant box.
  # We will use the available bare minimum Ubuntu 12.04 64bit 
  # box from http://www.vagrantbox.es
  config.vm.box_url   = "http://dl.dropbox.com/u/1537815/precise64.box"

  # You can also customize various VirtualBox settings.
  # For instance, we will increase the memory of VM box below:
  config.vm.customize ["modifyvm", :id, "--memory", ENV['vagrant_memory'] || '1024']

  # Provision with Chef Solo
  config.vm.provision :chef_solo do |chef|
    # Path to our Chef Cookbooks relative to this file
    chef.cookbooks_path = "./cookbooks"
    # Path to our Chef Roles relative to this file
    chef.roles_path     = "./roles"
    # The Chef Role for Vagrant to use
    chef.add_role "web"
  end
end