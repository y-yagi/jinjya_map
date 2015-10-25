source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', github: "rails/rails"
gem 'sprockets-rails', github: "rails/sprockets-rails"
gem 'sprockets', github: "rails/sprockets"
gem 'arel', github: "rails/arel"
gem 'rack', github: "rack/rack"
gem 'pg'
gem 'sass-rails', github: "rails/sass-rails"
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', github: "rails/coffee-rails"
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'moji'
gem 'geocoder'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'turbolinks', github: 'rails/turbolinks'
gem 'order_as_specified', github: 'panorama-ed/order_as_specified'
gem 'puma'
gem 'rake-guardian'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'web-console', github: 'rails/web-console'
  gem 'spring'
  gem 'rails-footnotes', '~> 4.0'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-material-design-lite'
  gem 'rails-assets-js-cookie'
  gem 'rails-assets-lodash'
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end

