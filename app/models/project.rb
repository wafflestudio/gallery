#coding : utf-8
class Project
  include Mongoid::Document
  include Mongoid::Paperclip
  field :title, :type => String
  field :description, :type => String
  field :mail, :type => String
  field :created_at, :type => Date

  has_many :project_images, dependent: :delete
  has_and_belongs_to_many :managers, class_name: "Member", inverse_of: :manage_projects
  has_and_belongs_to_many :designers, class_name:  "Member", inverse_of: :design_projects
  has_and_belongs_to_many :developers, class_name: "Member", inverse_of: :dev_projects
  accepts_nested_attributes_for :project_images, :allow_destroy => true
  accepts_nested_attributes_for :designers
  accepts_nested_attributes_for :developers

  def members
    (self.designers+self.developers).uniq
  end
end
