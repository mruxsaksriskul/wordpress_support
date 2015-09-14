require_relative 'spec_helper'

describe user('nobody') do
  it { should exist }
end

describe group('nobody') do
  it { should exist }
end
