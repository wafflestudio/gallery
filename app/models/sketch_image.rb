#coding : utf-8
require 'iconv'
class SketchImage
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  field :featured, :type => Boolean

  belongs_to :sketch

  def self.styles_dict
    {:large => "400x300", :small => "100x100"}
  end

  include ::ItemImageTemplate
end
