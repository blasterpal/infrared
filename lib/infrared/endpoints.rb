module Infrared
  module Endpoints
    extend self
    ENDPOINTS = 
      {
        signin: '/ghost/signin/',
        get_posts: '/ghost/api/v0.1/posts/'
      }
    def endpoint(key)
      ENDPOINTS[key.to_sym]
    end
  end
end
