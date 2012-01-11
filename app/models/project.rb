class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, :type => String
  field :description, :type => String
  field :mail, :type => String

  has_many :project_images
  accepts_nested_attributes_for :project_images, :allow_destroy => true
end
