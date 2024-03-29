source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

gem 'puma' # Use Puma as the app server
gem 'rails', '~> 7.0.1' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sass-rails' # Use SCSS for stylesheets
gem 'slim-rails' # Use Slim for html preprocessing
gem 'uglifier' # Use Uglifier as compressor for JavaScript assets

gem 'bootsnap', '>= 1.1.0', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'jquery-rails'
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks

gem 'actionpack-action_caching' # To cache Airtable downloads
gem 'airrecord' # Use Airtable as the database
gem 'redcarpet' # For rendering markdown from Airtable
gem 'fomantic-ui-sass', '~> 2.8.3' # Use Fomantic/Semantic as css framework
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f' # Setup source for mime-types depdendency

gem "matrix", "~> 0.4.2" # Required after upgrade to ruby 3.1

group :development, :test do
  gem 'dotenv-rails' # Auto-load environmental variables
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # gem 'listen'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
