require_relative 'spec_helper'

describe file('/opt/teamcity/.ssh') do
  it { should exist }
  it { should be_directory }
end

describe file('/opt/teamcity/.ssh/id_rsa') do
  it { should exist }
end
