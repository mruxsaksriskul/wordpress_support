# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'


describe 'chef-wordpresswrapper' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['opsmatic']['integration_token'] = 'SomeToken'
      stub_command('which sudo').and_return('/usr/bin/sudo')
      stub_command('which nginx').and_return('/usr/sbin/nginx')
      node.set['authorization']['sudo']['groups'] = ['admin', 'wheel', 'test']
      node.set['ssh_keys'] = ''
      node.default['ssh_keys'] = { test: ['test'] }
      node.set['users']['teams'] = ['test']
      stub_data_bag_item('users', 'test').and_return(id: 'test', team: 'test', ssh_keys: 'derp_key', administrator: 'true', group: 'test')
      stub_data_bag_item('users', 'fhanson').and_return(id: 'fhanson', team: 'test', ssh_keys: 'derp_key', administrator: 'true', group: 'test')
      stub_data_bag_item('users', 'rgindes').and_return(id: 'rgindes', team: 'test', ssh_keys: 'derp_key', administrator: 'true', group: 'test')
      stub_data_bag_item('users', 'jneves').and_return(id: 'jneves', team: 'test', ssh_keys: 'derp_key', administrator: 'true', group: 'test')
      stub_data_bag_item('users', 'jcrawford').and_return(id: 'jcrawford', team: 'test', ssh_keys: 'derp_key', administrator: 'true', group: 'test')
      stub_data_bag_item('users', 'blieberman').and_return(id: 'blieberman', team: 'test', ssh_keys: 'derp_key', administrator: 'true', group: 'test')
      stub_data_bag_item('users', 'akemner').and_return(id: 'akemner', team: 'test', ssh_keys: 'derp_key', administrator: 'true', group: 'test')
      stub_data_bag_item('users', 'nessus').and_return(id: "nessus", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test")
      stub_data_bag_item('wordpress', 'greenbay').and_return(id: 'greenbay' ,site_name: 'site', db_name: 'db', db_user: 'dbuser', db_password: 'derp')
      stub_command("test -d /etc/php-fpm.d || mkdir -p /etc/php-fpm.d").and_return('') 
    end.converge(described_recipe)
  end

  it 'includes the recipe nginx' do
    expect(chef_run).to include_recipe('nginx')
  end

  it 'installs package php-mysql' do
    expect(chef_run).to install_package('php-mysql')
  end

  it 'installs package Zend Memcache' do
    expect(chef_run).to install_package('php-ZendFramework-Cache-Backend-Libmemcached')
  end

  it 'installs wordpress nginx template' do
    expect(chef_run).to create_template('/etc/nginx/conf.d/wordpress.conf')
  end

  it 'installs wordpress config template' do
    expect(chef_run).to create_template('/var/www/wordpress/wp-config.php')
  end

  it 'installs wordpress file using ark' do
    expect(chef_run).to dump_ark('wordpress')
  end
end
