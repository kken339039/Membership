source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#
ruby '2.4.4'
gem 'rails', '~> 5.2.0'
gem 'faker'

# user_role_control
gem 'devise'
gem 'rolify'

# Database
gem 'pg', '~> 0.20'

# app server
gem 'puma', '~> 3.11'

# Frontend
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'bootsnap'
gem 'bootstrap'

# uploader
gem 'carrierwave'

# image
gem 'mini_magick'

# page
gem 'kaminari'

group :development, :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'shoulda'
  gem 'pry'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'sqlite3'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
