source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.5"

# Використовуйте Rails 5.2
gem "rails", "~> 7.0.0"

# Оригінальний pipeline для Rails
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

# Інші гемми
gem 'pg'
gem 'devise'
gem 'stripe'
gem 'friendly_id'
gem 'kaminari'
gem 'pundit'
gem 'acts-as-taggable-on', '~> 11.0'
gem 'rails_admin', '~> 3.1'
gem 'sassc-rails'
gem 'bootstrap', '~> 5.0'
gem 'nova_poshta', '~> 0.3.0'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
