 # encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'chef-wordpresswrapper::nginx' do
  
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      stub_command('which nginx').and_return(true)
    end.converge(described_recipe)
  end

  it 'includes the `nginx` recipe' do
    expect(chef_run).to include_recipe('nginx')
  end

  it 'does create, enable, and start nginx service' do
    expect(chef_run).to enable_service('nginx')
    expect(chef_run).to start_service('nginx')
  end

end
