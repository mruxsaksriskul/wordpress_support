require_relative 'spec_helper'

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/nginx/conf.d/wordpress.conf') do
  it { should exist }
end
