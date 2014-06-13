module Infrared
  module GhostApi
    #extend these method to rmove dupliation later, also use a simple template to add arguments?
    def posts
      JSON.parse((connection.get do |req|
        req.url (endpoint(:get_posts))
        req.headers = authenticated_headers
      end).body)
    end
    def post(id)
      JSON.pars(e(connection.get do |req|
        req.url (%{#{endpoint(:get_posts)}#{id}/})
        req.headers = authenticated_headers
      end).body)
      binding.pry
    end
    def add_post(data)
      res = connection.get do |req|
        req.url endpoint(:add_post)
        req.headers = authenticated_headers
      end
      connection.post  do |req|
        req.url endpoint(:add_post)
        req.headers = api_post_headers(res.body)
        req.body = data
      end
    end
  end
end
