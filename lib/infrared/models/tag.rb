class Infrared::Tag < Infrared::BaseModel
  include ActiveModel::Serialization
  include ActiveModel::Validations

attr_accessor :name, :id

  def initialize(name,id)
    @name,@id = name, id
  end

end
