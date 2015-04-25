source 'https://rubygems.org'

# Core gems
gem 'rails', '4.2.1'

# Database
gem 'mysql2'

# Asset management
gem 'carrierwave',                  '~> 0.10.0'
gem 'cloudinary',                   '~> 1.1.0'

# API
gem 'versionist',                   '~> 1.4.1'
gem 'rack-cors',                    '~> 0.4.0', require: 'rack/cors'
gem 'doorkeeper',                   '~> 2.2.0'
gem 'warden',                       '~> 1.2.3'

# Authorization
gem 'pundit',                       '~> 1.0.0'

# JSON serialization
gem 'active_model_serializers',     '~> 0.9.3'

# Better JSON validation error messages
gem 'rails_api_validation_errors',  '~> 1.0.1'

# Email
gem 'email_validator',              '~> 1.5.0'

# Token generation
gem 'ar-tokens',                    '~> 0.0.6'

# Password security
gem 'unix-crypt',                   '~> 1.3.0'

# Settings
gem 'settingslogic',                '~> 2.0.9'

# Server
gem 'puma',                         '~> 2.11.2'
gem 'foreman',                      '~> 0.78.0'

# Monitoring
gem 'airbrake',                     '~> 4.1.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Deployment
  gem 'capistrano-rails',           '~> 1.1.2',   require: false
  gem 'capistrano-bundler',         '~> 1.1.4',   require: false
  gem 'capistrano-rvm',             '~> 0.1.2',   require: false
  gem 'capistrano3-puma',           '~> 0.9.0',   require: false

  # Guard
  gem 'guard',                      '~> 2.12.5',  require: false
  gem 'guard-pow',                  '~> 2.0.0',   require: false
  gem 'guard-rspec',                '~> 4.5.0',   require: false
  gem 'guard-bundler',              '~> 2.1.0',   require: false
  gem 'guard-cane',                 '~> 0.2.1',   require: false

  # Pry console
  gem 'pry',                        '~> 0.10.1'
  gem 'pry-rails',                  '~> 0.3.4'
  gem 'pry-byebug',                 '~> 3.1.0'
  gem 'pry-stack_explorer',         '~> 0.4.9.2'
  gem 'pry-remote',                 '~> 0.1.8'

  # Console formatting
  gem 'awesome_print',              '~> 1.6.1'

  # RSpec testing instead of Test::Unit
  gem 'rspec-rails',                '~> 3.2.1'

  # Security scanner
  gem 'brakeman',                   '~> 3.0.2'

  # Cody quality
  gem 'cane',                       '~> 2.6.2'
  gem 'rails_best_practices',       '~> 1.15.7'
  gem 'reek',                       '~> 2.1.0'
  gem 'rubocop',                    '~> 0.30.0'

  # Documentation
  gem 'rspec_api_documentation',    '~> 4.3.0'

  # Patch-level verification
  gem 'bundler-audit',              '~> 0.3.1'

  # Email preview
  gem 'mail_view',                  '~> 2.0.4'

  # Object factory
  gem 'factory_girl_rails',         '~> 4.5.0'
end

###############################################
# Testing dependencies
###############################################

group :test do
  # Fast Faker for dummy data creation
  gem 'ffaker',                     '~> 2.0.0'

  # ActiveModel and ActiveRecord test helpers
  gem 'shoulda-matchers',           '~> 2.8.0'
  gem 'rspec_active_model_serializers', '~> 0.1.1'

  # Mountain Lion native notifications
  gem 'terminal-notifier-guard',    '~> 1.6.4'

  # Test coverage
  gem 'simplecov',                  '~> 0.10.0'
  gem 'simplecov-rcov',             '~> 0.2.3'
  gem 'simplecov-json',             '~> 0.2'

  # JSON testing
  gem 'json_spec',                  '~> 1.1.4'

  # Mock framework
  gem 'rr',                         '~> 1.1.2'

  # Jenkins RSpec support
  gem 'ci_reporter',                '~> 2.0.0'

  # Testing time-dependent methods
  gem 'timecop',                    '~> 0.7.3'
end

