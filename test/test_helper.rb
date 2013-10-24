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

require 'capybara/poltergeist'

Capybara.configure do |c|
  c.default_host = "http://edu.local"
  c.current_driver = :poltergeist #:poltergeist # selenium
  c.always_include_port = true
  # c.server_port = 3030
end

# Capybara.server do |app, port|
#   require 'rack/handler/webrick'
#   Rack::Handler::WEBrick.run(app, :Port => port, :AccessLog => [], :Logger => WEBrick::Log::new(Rails.root.join("log/capybara_test.log").to_s))
# end

# Capybara.register_driver :poltergeist do |app|
#   options = {
#     phantomjs_options: ['--load-images=no', '--disk-cache=false'],
#   }
#   Capybara::Poltergeist::Driver.new(app, options)
# end

FactoryGirl.reload

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
  #include Concerns::AuthManagment

  def http_referer=(url)
    @request.env['HTTP_REFERER'] = url
  end

  def subdomain(slug)
    request.host = "#{slug}.#{request.host}"
  end
end

class ActionDispatch::IntegrationTest
  def subdomain(slug)
    Capybara.app_host = "http://#{slug}.edu.local"
  end

  setup do
    Capybara.app_host = Capybara.default_host
  end
end

module SitePrism
  class Page
    def wait_for_ajax
      Timeout.timeout(Capybara.default_wait_time) do
        active = page.evaluate_script('jQuery.active') until active == 0
      end
    end
  end
end
