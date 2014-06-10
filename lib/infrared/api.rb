module Infrared
  class API

    include Infrared::Endpoints
    include Infrared::Development #gate this somehow?

    attr_accessor :connection, :cookies, :headers

    def initialize(email=nil, password=nil, url = nil)
      # Infrared.logger.info "BLAG!"  
      #
      @headers = {}
      start_conn(url)
      login(email,password)
    end

    private 
    def start_conn(url)
      @connection = Faraday.new(:url => url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def login(email,password)
      page_load = connection.get(endpoint(:signin))
      headers.merge!(page_load.headers)
      headers.merge!(csrf_token_from_body(page_load.body))
      response = connection.post do |req|
        req.url endpoint(:signin)
        req.headers  = headers
        req.params = {email: email, password: password}
      end
      binding.pry
    end
  
  def csrf_token_from_body(body)
    # raises some exceptions here for parsing
    t = ::Nokogiri::HTML(body).xpath('//meta[@name="csrf-param"]/@content')
    {"X-CSRF-Token" => ((t && t.first)? t.first.value : '')}
  end

  def cookies_from_response (response)
    @cookies = response.headers['set-cookie']
  end


  # def csrf_token(body)
  #   @r = connection.get(endpoint(:signin))
  #   cookies_from_response(@r)
  #   n = sushi(@r.body.to_s)
  #   t = n.xpath('//meta[@name="csrf-param"]/@content')
  #   binding.pry
  #   {"X-CSRF-Token" => ((t && t.first)? t.first.value : '')}
  # end

  # def sushi(response)
  #   Nokogiri::HTML(response)
  # end

  end
  end
