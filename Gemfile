source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
gem 'bootstrap-growl-rails'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'font-awesome-sass'
gem 'google_custom_search_api'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'rails_autolink'
gem 'redis', '~> 3.2'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'slim-rails', '~> 3.1', '>= 3.1.1'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate'
gem 'cocoon'
gem 'cloudinary'
gem 'carrierwave'

group :development, :test do
  gem 'letter_opener'
  gem 'byebug', platform: :mri
  gem 'erd'
  gem 'pry'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
