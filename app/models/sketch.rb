class Sketch
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, :type => String
  field :description, :type => String

  has_many :sketch_images
  accepts_nested_attributes_for :sketch_images, :allow_destroy => true
end
