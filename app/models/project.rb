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
  has_and_belongs_to_many :designers, class_name:  "Member", inverse_of: :projects
  has_and_belongs_to_many :developers, class_name: "Member", inverse_of: :projects
  accepts_nested_attributes_for :project_images, :allow_destroy => true
  accepts_nested_attributes_for :designers
  accepts_nested_attributes_for :developers
  accepts_nested_attributes_for :managers

  def members
    (self.designers+self.developers+self.managers).uniq
  end
  def roles(member)
    res = ""
      if self.managers.include?(member)
        res += "direct, "
      end
      if self.designers.include?(member)
        res += "design, "
      end
      if self.developers.include?(member)
        res += "develop, "
      end
    return res[0..-3]
  end
end
