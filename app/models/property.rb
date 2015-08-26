class Property
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  belongs_to :bird
end
