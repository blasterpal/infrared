class Infrared::Post < Infrared::BaseModel
  include ActiveModel::Serialization
  include ActiveModel::Validations

  attr_accessor :status,:title, :tags, :markdown, :id

  def initialize(title,markdown,status='draft',tags=[],id=nil)
    @title,@markdown,@status,@tags,@id = title,markdown,status,tags,id
  end

  def from_api_data(data)
    
  end

end
