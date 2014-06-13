require 'cgi'
require 'faraday'
require 'logger'
require 'nokogiri'
require 'active_support'
require 'infrared/defaults'
require 'infrared/logging'
require 'infrared/development'
require 'infrared/api/ghost_api'
require 'infrared/api'
require "infrared/version"

module Infrared
  def self.logger    
     include Infrared::Logging
     Infrared::Logging.logger
  end
end
