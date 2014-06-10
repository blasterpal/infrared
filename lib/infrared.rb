require 'faraday'
require 'logger'
require 'nokogiri'

require 'infrared/logging'
require 'infrared/development'
require 'infrared/endpoints'
require 'infrared/api'
require "infrared/version"

module Infrared
  def self.logger    
     include Infrared::Logging
     Infrared::Logging.logger
  end
end
