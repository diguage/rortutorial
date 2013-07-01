require 'rbconfig'

#source 'https://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.2.13'
gem 'bootstrap-sass', '2.0.4'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'
  gem 'spork', '0.9.2'
  gem 'wdm', '>= 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
  gem 'annotate', '2.5.0'  
end

group :production do
  gem 'pg', '0.12.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '2.0.2'

group :test do
  gem 'capybara', '1.1.2'
  
  if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i  #Windows?
    gem 'rb-fchange', '0.0.5'
    gem 'rb-notifu', '0.0.4'
    gem 'win32console', '1.3.0'
  elsif RbConfig::CONFIG['target_os'] =~ /linux|unix|freebsd/i  #Linux?
    gem 'rb-inotify', '0.8.8'
    gem 'libnotify', '0.5.9'
  else   #Mac?
    gem 'capybara', '1.1.2'
    gem 'rb-fsevent', '0.9.1', :require => false
    gem 'growl', '1.0.3'
  end
  
  gem 'factory_girl_rails', '4.1.0'  
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'  
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'debugger'
