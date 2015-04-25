# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require 'rack/test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'pundit/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.include ActionDispatch::TestProcess
  #config.include Requests::JsonHelpers, type: :controller

  # Mock upload to cloudinary
  config.before :each do
    stub(Cloudinary::Uploader).call_api do
      {
        "public_id"=>"oe26bmnhpvbwze1gnlpr",
         "version"=>1429214736,
         "signature"=>"97437d99770a3abfc3accad08a92d9bfa8056338",
         "width"=>640,
         "height"=>426,
         "format"=>"jpg",
         "resource_type"=>"image",
         "created_at"=>"2015-04-16T20:05:36Z",
         "tags"=>[],
         "bytes"=>131971,
         "type"=>"upload",
         "etag"=>"71d9f69d22046466c126c6bfcddee862",
         "url"=>"http://res.cloudinary.com/dbmgokodg/image/upload/v1429214736/oe26bmnhpvbwze1gnlpr.jpg",
         "secure_url"=>"https://res.cloudinary.com/dbmgokodg/image/upload/v1429214736/oe26bmnhpvbwze1gnlpr.jpg"
      }
    end
  end
end
