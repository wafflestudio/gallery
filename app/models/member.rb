#conding : utf-8
class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :facebook, :type => String
  field :twitter, :type => String

  has_and_belongs_to_many :projects
  has_and_belongs_to_many :sketches

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
