require 'cgi'
require 'faraday'
require 'logger'
require 'nokogiri'

require 'infrared/defaults'
require 'infrared/logging'
require 'infrared/development'
require 'infrared/api'
require "infrared/version"

module Infrared
  def self.logger    
     include Infrared::Logging
     Infrared::Logging.logger
  end
end
