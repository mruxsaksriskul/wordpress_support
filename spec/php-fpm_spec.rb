 # encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'php-fpm' do
  
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      stub_command('which php-fpm').and_return(true)
      stub_command('test -d /etc/php-fpm.d || mkdir -p /etc/php-fpm.d').and_return('')
    end.converge(described_recipe)
  end

  it 'includes the `php-fpm` recipe' do
    expect(chef_run).to include_recipe('php-fpm')
  end

  it 'does create, enable, and start php-fpm service' do
    expect(chef_run).to enable_service('php-fpm')
    expect(chef_run).to start_service('php-fpm')
  end

end
