class Family
  include Mongoid::Document
  field :family_name, type: String
  field :description, type: String

  belongs_to :bird
end
