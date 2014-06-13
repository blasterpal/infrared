#testing
require 'minitest/spec'
require 'minitest/autorun'
require 'webmock'
require 'webmock/minitest'

#app
require './lib/infrared'
require './spec/mocks/api'
#create webmocks
include Mocks::API

#other
require 'pry'


