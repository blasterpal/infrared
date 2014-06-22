#testing
require 'rspec'
require 'webmock'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.default_cassette_options = { :record => :new_episodes }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end


#app
require  './lib/infrared'

# app testing
# require_relative 'support/mock_api'
# require_relative 'support/mock_responses'
# include Mocks::API

# local ghost
# GHOST_HTTP_HOST = 'http://localhost:

#other
require 'pry'


include Infrared::Utils
