module Infrared
  class API
    include Infrared::Endpoints
    include Infrared::Development #gate this somehow?
    attr_accessor :connection
    def initialize(email=nil, password=nil, url = nil)
      # Infrared.logger.info "BLAG!"  
      binding.pry
      start_conn(url)
      login(email,password)
    end

    private 
    def start_conn(url)
      @connection = Faraday.new(:url => url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response @logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
    def login
      binding.pry
      connection.get('')
    end

  def csrf_token(url)
    @r = connection.get(endpoints(:signin))
    cookies_from_response(@r)
    n = sushi(@r.body.to_s)
    t = n.xpath('//meta[@name="csrf-param"]/@content')
    binding.pry
    {"X-CSRF-Token" => ((t && t.first)? t.first.value : '')}
  end
    
  end
end
