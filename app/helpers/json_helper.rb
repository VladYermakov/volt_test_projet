module JsonHelper

  class ActiveRecord::Base
    def to_json
      self.as_json(root: true).to_json
    end
  end

  def from_json(json)
    hash = JSON.parse(json)
    klass = hash.keys[0].capitalize.safe_constantize
    if klass.nil?
      nil
    else
      klass.new hash[hash.keys[0]]
    end
  end
end