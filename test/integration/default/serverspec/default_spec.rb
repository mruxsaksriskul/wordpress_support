require_relative 'spec_helper'

describe user('teamcity') do
  it { should exist }
end

describe group('teamcity') do
  it { should exist }
end
