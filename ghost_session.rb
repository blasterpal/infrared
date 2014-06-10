require 'http'
require 'pry'
require 'nokogiri'

class GhostSession

  URL='http://localhost:2368'
  APPLICATION_NAME = 'Beaver Fun'

  API = {
    signin: '/ghost/signin/',
    get_posts: '/ghost/api/v0.1/posts/'
  }

  attr_accessor :email,:password, :session, :crsf_token, :cookies, :url

  def initialize(options={})
    # convert options to symbols
    @email= options[:email] || ''
    @password = options[:password] || ''
    @cookies = options[:cookies] || ''
    @url = options['url'] || URL
    @crsf_token = ''
  end

  def endpoint(key)
    "#{url}#{API[key]}"
  end

  def login
    data = {'email' => email, 'password' => password}
    token = csrf_token(endpoint(:signin))
    headers = default_headers.merge(token)
    puts "body: #{data}"
    puts "headers: #{headers}"
    @r = HTTP.with_headers(headers).post(endpoint(:signin), :form => data)
    cookies_from_response(@r)
    @r
  end

  def default_headers
    {
      "Accept" => "*/*",
      "Accept-Encoding" => 'gzip,deflate,sdch',
      "Accept-Language" => "en-US,en;q=0.8",
      "Connection" => "keep-alive",
      "Content-Type" => 'application/x-www-form-urlencoded; charset=UTF-8',
      "X-Requested-With" => "XMLHttpRequest" ,
      :cookie => cookies}
  end

  def csrf_token(url)
   @r = HTTP.get(url)
    cookies_from_response(@r)
    n = sushi(@r.body.to_s)
    t = n.xpath('//meta[@name="csrf-param"]/@content')
    binding.pry
    {"X-CSRF-Token" => ((t && t.first)? t.first.value : '')}
  end

  def cookies_from_response (response)
    @cookies = response.headers['set-cookie']
  end

  def sushi(response)
    Nokogiri::HTML(response)
  end


end


