require './spec/spec_helper.rb'

describe Infrared::API do
  # before do
  #   stub_request(:get, "http://ghost.example.com/ghost/signin/").
  #     with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0'}).
  #     to_return(:status => 200, :body => "", :headers => {})

  #   stub_request(:post, "http://ghost.example.com/ghost/signin/").with(:body => "email=hbeaver%40gmail.com&password=password",
  #                                                                        :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Accept-Language'=>'en-US,en;q=0.8', 'Connection'=>'keep-alive', 'Content-Type'=>'application/x-www-form-urlencoded; charset=UTF-8', 'Cookie'=>'connect.sid=', 'User-Agent'=>'Ruby', 'X-Csrf-Token'=>'', 'X-Requested-With'=>'XMLHttpRequest'}).
  #                                                                        to_return(:status => 200, :body => "", :headers => {})
  # end
  
  before do
    signin_mock
  end
  it "should have session_id after authorizing" do
    @api =Infrared::API.new('http://ghost.example.com','hbeaver@gmail.com','password') 
    @api.session_id.wont_be_empty
  end
end
