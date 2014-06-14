module Infrared
  module Session
    # extend self

    # Exceptions
    # URI::BadURIError
    def conn(url)
      @connection = Faraday.new(:url => url) do |faraday|
        faraday.use :cookie_jar
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
        req.headers  = auth_headers(connection.get(endpoint(:signin)))
        req.body = {email: email, password: password}
      end
      # @session_id = _user_session_from_cookie(response)
      _inject_conn_into_models
    end

    
    private 

    # used for posting json
    def post_headers(response=nil)
      hdrs = {"Content-Type" => 'application/json',"Accept" => "application/json, text/javascript, */*; q=0.01"}
      @headers.merge!(auth_headers(reponse.body))
      @headers.merge!(hdrs)
    end
    
    # used for general auth
    def auth_headers(response=nil)
      @headers.merge!(default_headers)
      @headers.merge!(csrf_token_from_response(response)) if response
      # @headers.merge!(@session_id) if @session_id
    end

    def _create_session(response)
      # @session_id = _user_session_from_response(response) if response
    end
    
    def _inject_conn_into_models
      BaseModel.connection = self
    end
    
    def _csrf_token_from_response(response)
      # raises some exceptions here for parsing
      t = ::Nokogiri::HTML(response.body).xpath('//meta[@name="csrf-param"]/@content')
      {"X-CSRF-Token" => ((t && t.first)? t.first.value : '')}
    end

    #  get session  cookie
    # def _user_session_from_response(response)
    #   @cookies = CGI::Cookie.parse(response.headers['set-cookie'])
    #   {"Cookie" => "connect.sid=#{cookies['connect.sid'].first}"}
    # end

  end
end
