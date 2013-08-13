source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# View
gem 'jquery-rails'
gem 'jquery-ui-rails',              '2.0.2'
gem 'simple_form'
gem 'less-rails'
gem 'ancestry'
gem 'draper'
gem 'wicked'
gem 'redcarpet'

group :development do
#  gem 'better_errors'
#  gem 'binding_of_caller'
#  gem 'meta_request'
  gem 'rails_info'#, path: '../../gem_repos/engines/rails_info'
  gem 'sextant'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.2'
end

group :test, :cucumber do
  gem 'shoulda-matchers'
  gem 'selenium-webdriver',       '2.27.2'
  gem 'spork',                    '~> 1.0rc'
  gem 'timecop'
  gem 'simplecov', :require => false
end

group :test do
  gem 'database_cleaner'
end

group :development, :test, :cucumber do
  gem 'factory_girl_rails'
end

group :cucumber do
  gem 'capybara',         '1.1.2'
  gem 'capybara-webkit',  '0.13.0'
  gem 'cucumber-rails',   '1.3.0', :require => false
  gem 'launchy',          '2.0.5'
  gem 'guard-rspec'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass',               '~> 2.3.1.0'
  gem 'therubyracer', '0.10.2', platforms: :ruby
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0', :require => "bcrypt"

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'


 


