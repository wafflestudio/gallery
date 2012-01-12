#coding : utf-8
class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  field :title, :type => String
  field :description, :type => String
  field :mail, :type => String
  has_mongoid_attached_file :avatar

  has_many :project_images
  has_and_belongs_to_many :designers, class_name:  "Member", inverse_of: :project
  has_and_belongs_to_many :developers, class_name: "Member", inverse_of: :project
  accepts_nested_attributes_for :project_images, :allow_destroy => true
  accepts_nested_attributes_for :designers
  accepts_nested_attributes_for :developers
end
