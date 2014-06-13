module Infrared
  class API

    include Infrared::Defaults
    include Infrared::Development #add into module elsewhere based ENV

    # class BadRequest < Faraday::Error; end

    attr_accessor :connection, :cookies, :headers, :session_id

    def initialize(url=nil,email=nil, password=nil)
      @connection = conn(url)
      @headers = {}
      @cookies = []
      @session_id = {}
      authorize(email,password)
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
    def authorize(email,password)
      response = connection.post do |req|
        req.url endpoint(:signin)
        req.headers  = create_headers_for_authorize(connection.get(endpoint(:signin)))
        req.body = {email: email, password: password}
      end
      session_id = user_session_from_cookie(response.headers)
    end

    def create_headers_for_authorize(response)
      headers.merge!(default_headers)
      headers.merge!(csrf_token_from_body(response.body))
      headers.merge!(user_session_from_cookie(response.headers))
    end
    
    def csrf_token_from_body(body)
      # raises some exceptions here for parsing
      t = ::Nokogiri::HTML(body).xpath('//meta[@name="csrf-param"]/@content')
      {"X-CSRF-Token" => ((t && t.first)? t.first.value : '')}
    end

    # subset of cookies
    def user_session_from_cookie(headers)
      cookies = CGI::Cookie.parse(headers['set-cookie'])
      {"Cookie" => "connect.sid=#{cookies['connect.sid'].first}"}
    end

  end
end
