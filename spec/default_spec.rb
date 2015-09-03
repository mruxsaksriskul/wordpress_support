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
      stub_data_bag_item("wordpress", "greenbay").and_return(id: 'greenbay' ,site_name: 'blogs.greenbay.com', db_name: 'greenbaydb', db_user: 'gblogadmin', db_password: 'hAiw39rdk')
      
    end.converge(described_recipe)
  end


  it 'includes the recipe nginx' do
    expect(chef_run).to include_recipe('nginx')
  end

end
