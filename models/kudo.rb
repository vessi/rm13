# Kudo model
class Kudo
  include Mongoid::Document

  field :name, type: String, default: ''
end
