class Sketch
  include Mongoid::Document
  include Mongoid::Paperclip
  field :title, :type => String
  field :description, :type => String
  field :created_at, :type => Date

  has_many :sketch_images
  has_and_belongs_to_many :designers, class_name: "Member", inverse_of: :sketches
  has_and_belongs_to_many :members
  accepts_nested_attributes_for :sketch_images, :allow_destroy => true
  accepts_nested_attributes_for :designers

end
