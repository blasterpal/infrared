#testing
require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'webmock'
require 'webmock/minitest'

require 'sham_rack'

#app
require  './lib/infrared'
# require_relative 'support/mock_api'
require_relative 'support/api_dummy_app'
require_relative 'support/mock_responses'

# include Mocks::API

include Support::MockResponses
ShamRack.at('ghost.example.com').rackup do
   run ApiDummyApp
end

#other
require 'pry'


include Infrared::Utils
