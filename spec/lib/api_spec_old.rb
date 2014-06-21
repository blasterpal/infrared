require './spec/spec_helper.rb'

describe Infrared::API do
  before do
    signin_mock
    @api =Infrared::API.new('http://ghost.example.com','hbeaver@gmail.com','password') 
  end
  it "should have session_id after authorizing" do
    @api.session_id.wont_be_empty
  end
  it "should have a valid connection after loggin" do
    @api.connection.must_be_instance_of Faraday::Connection
    binding.pry
    @api.connection.status.must_be :==,200
  end
end
