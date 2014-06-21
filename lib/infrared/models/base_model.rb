class Infrared::BaseModel
  include ActiveModel::Serialization
  include ActiveModel::Validations

  class << self
    def connection=(conn)
      @@connection = conn
    end
    def connection
      @@connection
    end
    
    def all
      connection.posts
    end
    def find(id)
      connection.post(id)
    end
    def from_api_data(data)
      raise "NotImplemented"
    end
  end

end
