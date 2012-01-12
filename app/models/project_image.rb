#conding : utf-8
require 'iconv'
class ProjectImage
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  field :featured, :type => Boolean

  def self.styles_dict
    {:large => "500x300", :small => "100x100"}
  end

  belongs_to :project, :inverse_of => :project_images

  include ::ItemImageTemplate
end
