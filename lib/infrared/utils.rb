module Infrared
  module Utils
    # extend self

    ENDPOINTS =
      {
      signin: '/ghost/signin/',
      get_posts: '/ghost/api/v0.1/posts/',
      get_post: '/ghost/api/v0.1/posts/',
      add_post: '/ghost/api/v0.1/posts/'
    }

    def endpoint(key)
      ENDPOINTS[key.to_sym]
    end

    def endpoints
      ENDPOINTS
    end

    def default_headers
      {
        "Accept" => "*/*",
        # "Accept-Encoding" => 'gzip,deflate,sdch',
        "Accept-Language" => "en-US,en;q=0.8",
        "Connection" => "keep-alive",
        "Content-Type" => 'application/x-www-form-urlencoded; charset=UTF-8',
        "X-Requested-With" => "XMLHttpRequest"}
    end

  end
end
