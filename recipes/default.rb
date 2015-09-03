#
# Cookbook Name:: chef-wordpresswrapper
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'php'
include_recipe 'php-fpm'
include_recipe 'nginx'
include_recipe 'ark'

# using apt
package 'php-mysql' do
  action :install
end

package 'php-ZendFramework-Cache-Backend-Libmemcached' do
  action :install
end

ark 'wordpress' do
  url node['wordpress']['url']
  path '/var/www'
  action :dump
  owner 'nobody'
end

template '/etc/nginx/conf.d/wordpress.conf' do
  source 'nginxsite.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

data = data_bag_item('wordpress', node['wordpress']['databag']['site'])
template "#{node['wordpress']['dir']}/wp-config.php" do
  source 'wp-config.php.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    :wp_config_options => node['wordpress']['wp_config_options'],
    :db_charset => node['wordpress']['db']['charset'],
    :db_collate => node['wordpress']['db']['collate'],
    :db_host => node['wordpress']['db']['host'],
    :db_user => data ['db_user'],
    :db_name => data ['db_name'],
    :db_password => data ['db_password']
  )
end
