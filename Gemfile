source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "pg", "~> 1.5"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false

gem "bcrypt"
gem "image_processing"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "erb_lint", require: false
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
  gem "standard", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
