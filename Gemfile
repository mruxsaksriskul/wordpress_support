# -*- encoding: utf-8 -*-
source 'https://rubygems.org'

gem 'chef-handler-profiler'
gem 'chef-handler-datadog'
gem 'chef-handler-opsmatic'

group :test do
  gem 'berkshelf', '~> 3.1'
  gem 'chefspec', '>= 3.1'
  gem 'foodcritic', '>= 3.0'
  gem 'rake', '>= 10.2'
  gem 'rubocop', '= 0.28.0'
end

group :integration do
  gem 'guard', '>= 2.6'
  gem 'guard-foodcritic', '~> 1.0.0'
  gem 'guard-kitchen'
  gem 'guard-rspec'
  gem 'guard-rubocop', '>= 1.1'
  gem 'kitchen-vagrant'
  gem 'test-kitchen', '~> 1.2.0'
  gem 'travis-lint'
  gem 'chef-handler-profiler'
  gem 'chef-handler-datadog'
  gem 'chef-handler-opsmatic'
  gem 'serverspec'
end
group :development do
  gem 'webmock'
  gem 'fauxhai'
end
