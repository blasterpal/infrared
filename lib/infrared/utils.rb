module Infrared
  module Utils
    # extend self

    ENDPOINTS =
      {
      signin: '/ghost/signin/',
      get_posts: '/ghost/api/v0.1/posts/',
      get_post: '/ghost/api/v0.1/posts/',
      add_post: '/ghost/api/v0.1/posts/'
    }

    def endpoint(key)
      ENDPOINTS[key.to_sym]
    end

    def endpoints
      ENDPOINTS
    end

    def default_headers
      {
        "Accept" => "*/*",
        # "Accept-Encoding" => 'gzip,deflate,sdch',
        "Accept-Language" => "en-US,en;q=0.8",
        "Connection" => "keep-alive",
        "Content-Type" => 'application/x-www-form-urlencoded; charset=UTF-8',
        "X-Requested-With" => "XMLHttpRequest"}
    end


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
        req.headers  = create_headers_for_request(connection.get(endpoint(:signin)))
        req.body = {email: email, password: password}
      end
      @session_id = user_session_from_cookie(response.headers)
      inject_conn_into_models
    end

    def create_headers_for_request(response)
      @headers.merge!(default_headers)
      @headers.merge!(csrf_token_from_body(response.body))
      @headers.merge!(user_session_from_cookie(response.headers))
    end

    def csrf_token_from_body(body)
      # raises some exceptions here for parsing
      t = ::Nokogiri::HTML(body).xpath('//meta[@name="csrf-param"]/@content')
      {"X-CSRF-Token" => ((t && t.first)? t.first.value : '')}
    end

    # subset of cookies
    def user_session_from_cookie(headers)
      @cookies = CGI::Cookie.parse(headers['set-cookie'])
      {"Cookie" => "connect.sid=#{cookies['connect.sid'].first}"}
    end

    def api_post_headers(body=nil)
      hdrs = {"Content-Type" => 'application/json',"Accept" => "application/json, text/javascript, */*; q=0.01"}
      @headers.merge!(authenticated_headers(body))
      @headers.merge!(hdrs)
    end

    def authenticated_headers(body=nil)
      @headers.merge!(csrf_token_from_body(body)) if body
      @headers.merge!(default_headers)
      @headers.merge!(self.session_id)
    end
    
    def inject_conn_into_models
      Post.connection = self
      Tag.connection = self
    end

  end
end
