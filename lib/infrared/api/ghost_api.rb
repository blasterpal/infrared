module Infrared
  module GhostApi
    #extend these method to rmove dupliation later, also use a simple template to add arguments?
    def posts
      connection.get do |req|
        req.url (endpoint(:get_posts))
        req.headers = session_id
      end
    end
    def post(id)
      connection.get do |req|
        req.url (%{#{endpoint(:get_posts)}/#{id}/})
        req.headers = session_id
      end
    end
  end
end
