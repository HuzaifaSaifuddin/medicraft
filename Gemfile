source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.6'

# Use Puma as the app server
gem 'puma', '~> 3.11'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use MongoDB for data storage
gem 'mongoid', '~> 7.4'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use jQuery as an alternate to JavaScript Syntax
gem 'jquery-rails', '~> 4.4'

# Use jQuery Validation to validate client-side form
gem 'jquery-validation-rails'

# Use Rolify to assign roles
gem 'rolify', '~> 6.0'

# Font Awesome
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.7'

# Time Difference
gem 'time_difference', '~> 0.7.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Use Rspec for testing
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'

  # Use to create factories for testing
  gem 'factory_bot_rails', '~> 6.2'

  # Use to create fake data
  gem 'faker', '~> 2.20'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  gem 'listen', '>= 3.0.5', '< 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'spring-watcher-listen', '~> 2.0.0'

  # Use for style checking and code formatting
  gem 'rubocop', '~> 1.28', '>= 1.28.2'

  # Use for performance queries checking
  gem 'rubocop-performance', '~> 1.13', '>= 1.13.3'

  # Use ErbLint for erb style checking and code formatting
  gem 'erb_lint', '~> 0.1.1', require: false

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem 'rack-mini-profiler'
end

group :test do
  # Generate Report of test
  gem 'simplecov', '~> 0.21.2'

  # Shoulda Matchers provides RSpec one-liners to test common Rails functionality
  gem 'shoulda-matchers', '~> 5.1'

  # Clean Test DB
  gem 'database_cleaner-mongoid', '~> 2.0', '>= 2.0.1'
end
