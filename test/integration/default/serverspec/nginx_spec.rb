require_relative 'spec_helper'

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/nginx/sites-enabled/teamcity-server') do
  it { should be_linked_to '/etc/nginx/sites-available/teamcity-server' }
end
