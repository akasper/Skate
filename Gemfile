source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem "dm-rails"
gem 'dm-migrations'
gem 'dm-validations'
gem "haml"
# 
#TODO: Upgrade to postgres
group :test, :development do
  gem 'mysql'
  gem 'dm-mysql-adapter'
end

group :development, :test do
  gem 'ruby-debug19'
  gem "capybara"
  gem 'database_cleaner'
  gem "rspec-rails"
  gem "cucumber-rails"
end
