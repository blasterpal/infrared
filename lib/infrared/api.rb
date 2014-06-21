module Infrared
  class API
    include Infrared::Utils
    include Infrared::Development #add into module elsewhere based ENV

    # class BadRequest < Faraday::Error; end

    attr_accessor :connection, :cookies, :headers, :session_id, :csrf_token

    def initialize(options = {url: nil,email: nil, password: nil})
      # hash arguments
      opts = options.symbolize_keys!
      @connection = initialize_conn(opts[:url])
      @headers = {}
      @cookies = []
      @session_id = {}
      login(opts[:email],opts[:password])
    end

    # Exceptions
    # URI::BadURIError
    def initialize_conn(url)
      @connection = Faraday.new(:url => url) do |faraday|
        faraday.use :cookie_jar
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
    
    # Exceptions
    # URI::Generic:0x007fe3b09dd578> (NoMethodError) 
    def login(email,password)
      response = connection.post do |req|
        req.url endpoint(:signin)
        req.headers  = login_headers
        req.body = {email: email, password: password}
      end
      if response.status > 200
        raise "Not Authorized"
      else
        # @session_id = _user_session_from_response(response)
        # _inject_conn_into_models
        response
      end
    end

    #improve to remove dupliation later, also use a simple template to add arguments?
    # posts(:all) to get all posts, draft and published
    # options are :all,:draft,:published

    def posts(status=:published)
      params = {status: status} #converted to strings
      JSON.parse((connection.get do |req|
        req.params = params
        req.url (endpoint(:get_posts))
        req.headers = session_headers
      end).body)
    end

    def post(id)
      JSON.parse((connection.get do |req|
        req.url (%{#{endpoint(:get_posts)}#{id}/})
          req.headers = authenticated_headers
      end).body)
    end
    def add_post(data)
      res = connection.get do |req|
        req.url endpoint(:add_post)
        req.headers = authenticated_headers
      end
      connection.post  do |req|
        req.url endpoint(:add_post)
        req.headers = api_post_headers(res.body)
        req.body = data
      end
    end
  end
end
