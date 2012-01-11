#conding : utf-8
require 'iconv'
class ProjectImage
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  field :featured, :type => Boolean

  belongs_to :project

  def self.styles_dict
    {:large => "500x300", :small => "100x100"}
  end

  include ::ItemImageTemplate
end
