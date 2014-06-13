module Infrared
  class API

    include Infrared::Utils
    include Infrared::Development #add into module elsewhere based ENV
    include Infrared::GhostApi

    # class BadRequest < Faraday::Error; end

    attr_accessor :connection, :cookies, :headers, :session_id

    def initialize(url=nil,email=nil, password=nil)
      @connection = conn(url)
      @headers = {}
      @cookies = []
      @session_id = {}
      authorize(email,password)
    end

  end
end
