#conding : utf-8
class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :name, :type => String
  field :organization, :type => String
  field :facebook, :type => String
  field :twitter, :type => String
  field :phone, :type => String
  field :admin, :type => Boolean, default: false
  has_mongoid_attached_file :photo, :styles => {
    :large => ['400x300']
  }

  has_and_belongs_to_many :manage_projects, class_name: "Project", inverse_of: :managers
  has_and_belongs_to_many :design_projects, class_name: "Project", inverse_of: :designers
  has_and_belongs_to_many :dev_projects, class_name: "Project", inverse_of: :developers
  has_and_belongs_to_many :sketches

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
