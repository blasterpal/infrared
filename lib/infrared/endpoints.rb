module Infrared
  module Endpoints
    extend self
    def endpoints
      {
        signin: '/ghost/signin/',
        get_posts: '/ghost/api/v0.1/posts/'
      }
    end
  end
end
