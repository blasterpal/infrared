module Infrared
  class API

    include Infrared::Defaults
    include Infrared::Development #add into module elsewhere based ENV

    # class BadRequest < Faraday::Error; end

    attr_accessor :connection, :cookies, :headers, :session

    def initialize(url=nil,email=nil, password=nil)
      @connection = conn(url)
      @headers = {}
      login(email,password)
    end

    private 
    # Exceptions
    # URI::BadURIError
    def conn(url)
      @connection = Faraday.new(:url => url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    # Exceptions
    # URI::Generic:0x007fe3b09dd578> (NoMethodError) 
    def login(email,password)
      first_load = connection.get(endpoint(:signin))
      set_headers(first_load) 
      set_session(first_load)  
      body = {email: email, password: password}
      response = connection.post do |req|
        req.url endpoint(:signin)
        req.headers  = headers
        # req.params = {email: email, password: password}
        req.body = body
      end
      binding.pry
    end

    def csrf_token_from_body(body)
      # raises some exceptions here for parsing
      t = ::Nokogiri::HTML(body).xpath('//meta[@name="csrf-param"]/@content')
      {"X-CSRF-Token" => ((t && t.first)? t.first.value : '')}
    end

    def set_headers(response)
      headers.merge!(default_headers)
      headers.merge!(set_session(response))
      headers.merge!(csrf_token_from_body(response.body))
    end

    def set_session(response)
      cookies = CGI::Cookie.parse(response.headers['set-cookie'])
      cookies = ({"Cookie" => "connect.sid=#{cookies['connect.sid'].first}"})
    end

  end
end
