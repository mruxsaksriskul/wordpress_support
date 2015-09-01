# -*- mode: ruby -*-
# vi: set ft=ruby :

my_iso = '/Users/ceichhorn/Downloads/VirtualMachines/ovftransport.iso'
my_api = "2"

Vagrant.configure(my_api) do |config|
  config.vm.box = "/Users/ceichhorn/Downloads/VirtualMachines/centos66-cloud-1.8.box"
  config.vm.box_check_update = true
  config.vm.hostname = "testing"
#  config.berkshelf.enabled = true

  config.vm.provision "chef_zero" do |chef|
#    chef.add_role "appserv-feeds"
#    chef.json = {
     chef.add_recipe "chef-wordpresswrapper"
#     chef.add_recipe "nginx"
     
end
#  config.omnibus.chef_version = :latest
#  config.omnibus.install_url = 'https://deploy.gmti.gbahn.net/chef/install.sh'

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "1024"
    vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 0, '--device', 0, '--type', 'dvddrive', '--medium', my_iso]
  end

  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  
  # config.vm.synced_folder '.', '/vagrant', disabled: true
end
