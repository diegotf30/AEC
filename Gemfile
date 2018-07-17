source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '~> 5.1.4'

# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Custom CSS
gem 'twitter-bootstrap-rails'
# Flexible Authentication
gem 'devise'
# Jquery
gem 'jquery-rails'

gem 'listen'
gem 'administrate'

group :development do
  gem 'byebug'
  gem 'certified', '~> 0.1.2'
  gem 'foreman', '~> 0.63.0'
  gem 'pry-rails', '~> 0.3.2'
  gem 'spring', '~> 1.2.0'
end

group :development, :test do
  gem 'bundler-audit', require: false
  gem 'bullet'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'spring-commands-rspec', '1.0.4'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'email_spec', '~> 1.6.0'
  gem 'json-schema'
  gem 'prickle'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1.0'
  gem 'sinatra'
  gem 'timecop', '~> 0.8.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
