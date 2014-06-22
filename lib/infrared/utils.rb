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

    #util method to get csrf token out of response body 
    def csrf_token_from_response(response)
      # raises some exceptions here for parsing
      t = ::Nokogiri::HTML(response.body).xpath('//meta[@name="csrf-param"]/@content')
      {"X-CSRF-Token" => ((t && t.first)? t.first.value : 'NULL')}
    end

    #used for posting json
    def post_headers(response=nil)
      hdrs = {"Content-Type" => 'application/json',
        "Accept" => "application/json, text/javascript, */*; q=0.01"}
      @headers.merge!(hdrs)
    end

    #session headers - the default headers, after login
    def session_headers(response=nil)
      hdrs = {"Content-Type" => 'application/json',
        "Accept" => "application/json, text/javascript, */*; q=0.01"}
      @headers.merge!(hdrs)
    end
    
    #push API into models
    def inject_conn_into_models
      BaseModel.connection = self
    end
    
    #baseline headers
    def default_headers
      {
        "Accept" => "*/*",
        # "Accept-Encoding" => 'gzip,deflate,sdch',
        "Accept-Language" => "en-US,en;q=0.8",
        "Connection" => "keep-alive",
        "Content-Type" => 'application/x-www-form-urlencoded; charset=UTF-8',
        "X-Requested-With" => "XMLHttpRequest"}
    end

  end
end
