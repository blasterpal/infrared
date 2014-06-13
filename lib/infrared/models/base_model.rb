class BaseModel
  include ActiveModel::Serialization
  include ActiveModel::Validations

  class << self
    def connection=(conn)
      @@connection = conn
    end
    def connection
      @@connection
    end

    def find(id)
      binding.pry
    end
  end

end
