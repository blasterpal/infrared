require './spec/spec_helper'

describe Infrared::API do

  let(:auth_hash){ {url: 'http://ghost.example.com',email:'hbeaver@gmail.com',password:'password'}}
  let(:api) { Infrared::API.new(auth_hash)}

  before do
  end

  describe '#initialize_connection' do
    it 'should obtain a connection' do
      api.connection.class.must_equal Faraday::Connection
    end
  end

  describe '#login_headers' do
    it 'should return hash with csrf_token' do
      api.login_headers["X-CSRF-Token"].must_equal "Zhgew1B2MW/KCWJ3LUjLf/+rAIJYuzqfc6fh4="
    end
  end

  describe "#posts" do
    it "no arguments should return published post" do
      api.posts.must_be :==, JSON.parse(mock_published_post)
    end
    it "status of draft should return draft post" do
      api.posts(:draft).must_be :==, JSON.parse(mock_draft_post)
    end
    it "status of published should return published json" do
      api.posts(:published).must_be :==, JSON.parse(mock_published_post)
    end
    it "status of all should return all posts" do
      api.posts(:all).must_be :==, JSON.parse(mock_all_posts)
    end
  end


  # it 'expires cookie' do
  #   conn.get('/expires')
  #   expect(conn.get('/dump').body).to eq('foo=bar')
  #   sleep 2
  #   expect(conn.get('/dump').body).to_not eq('foo=bar')
  # end

  # it 'fills an injected cookie jar' do

  #   conn_with_jar = Faraday.new(:url => 'http://faraday.example.com') do |conn|
  #     conn.use :cookie_jar, jar: cookie_jar
  #     conn.adapter :net_http # for sham_rock
  #   end

  #   conn_with_jar.get('/default')

  #   expect(cookie_jar.empty?).to be_false

  # end

  # it 'multiple cookies' do
  #   conn.get('/default')

  #   response = conn.send('get') do |request|
  #     request.url '/multiple_cookies'
  #     request.headers.merge!({:Cookie => 'language=english'})
  #   end

  #   expect(response.body).to eq('foo=bar;language=english')
  # end

end

