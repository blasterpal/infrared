# external gems
require 'cgi'
require 'faraday'
require 'faraday-cookie_jar'
require 'logger'
require 'nokogiri'
require 'activemodel'
require 'json'

# app requires
require 'infrared/session'
require 'infrared/utils'
require 'infrared/logging'
require 'infrared/development'

#models
require 'infrared/models/base_model'
require 'infrared/models/tag'
require 'infrared/models/post'

#ghost api
require 'infrared/api/ghost_api'
require 'infrared/api'
require "infrared/version"

module Infrared
  def self.logger    
     include Infrared::Logging
     Infrared::Logging.logger
  end
end

