require_relative 'spec_helper'

describe file('/opt/teamcity') do
  it { should exist }
  it { should be_directory }
end

scalr_path = '/opt/teamcity/dev-ops/scalr'

describe file("#{scalr_path}/bump_global.py") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'teamcity' }
end

describe file("#{scalr_path}/recycle_boxes.py") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'teamcity' }
end

describe file("#{scalr_path}/tc-build-grab.py") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'teamcity' }
end

ci_path = '/opt/teamcity/dev-ops/ci'

describe file("#{ci_path}/push_to_tc_pypi.sh") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'teamcity' }
end

describe file("#{ci_path}/wheels_up.py") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'teamcity' }
end
