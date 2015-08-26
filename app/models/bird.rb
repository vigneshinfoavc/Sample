class Bird
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :family, type: String
  field :continents, type: String
  field :visible, type: Mongoid::Boolean, default: false
  field :uniqueitem, type: Boolean

  validates :name, :continents, :visible, presence: true

  has_many :properties
  has_many :families
end
