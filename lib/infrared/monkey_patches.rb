module Infrared
  module MonkeyPatches
    #nada
  end
end

#copied straight from ActiveSupport
class Hash
  def sym_keys!
    trans_keys!{ |key| key.to_sym rescue key }
  end
  def trans_keys!
    keys.each do |key|
      self[yield(key)] = delete(key)
    end
    self
  end
end

