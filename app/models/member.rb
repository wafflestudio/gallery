#conding : utf-8
class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :facebook, :type => String
  field :twitter, :type => String
  field :admin, :type => Boolean

  has_and_belongs_to_many :manage_projects, class_name: "Project", inverse_of: :managers
  has_and_belongs_to_many :manage_sketches, class_name: "Sketch", inverse_of: :managers
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :sketches

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
