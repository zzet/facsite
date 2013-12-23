ENV["RAILS_ENV"] = "test"

require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'
require "minitest/rails"
require "minitest/hell" #NOTE parallel

require 'wrong/adapters/minitest'
Wrong.config.color
# Wrong.config.verbose

require 'mocha/setup'
require 'mocha/api'
require 'sidekiq/testing/inline'

Dir[File.expand_path('../support/*.rb', __FILE__)].each { |f| require f }

FactoryGirl.reload

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
  #include Concerns::AuthManagment

  def http_referer=(url)
    @request.env['HTTP_REFERER'] = url
  end

end

class ActionDispatch::IntegrationTest
end
