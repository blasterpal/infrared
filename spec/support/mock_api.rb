require './spec/spec_helper'
module Mocks
  module API
    extend self
    def signin_mock

      # stub_request(:get, "http://ghost.example.com/ghost/signin/").
      #   with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0'}).
      #   to_return(:status => 200, :body => "", :headers => {})

      # stub_request(:post, "http://ghost.example.com/ghost/signin/").with(:body => "email=hbeaver%40gmail.com&password=password",
      #                                                                    :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Accept-Language'=>'en-US,en;q=0.8', 'Connection'=>'keep-alive', 'Content-Type'=>'application/x-www-form-urlencoded; charset=UTF-8', 'Cookie'=>'connect.sid=', 'User-Agent'=>'Ruby', 'X-Csrf-Token'=>'', 'X-Requested-With'=>'XMLHttpRequest'}).
      #                                                                    to_return(:status => 200, :body => "", :headers => {})
    end
  end
end
