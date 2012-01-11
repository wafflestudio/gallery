#coding : utf-8
module ItemImageTemplate
  def self.included(recipient)
    recipient.class_eval do
      def self.symbolized_class_name
        name.underscore.to_sym
      end

      def self.image_path
        Rails.root.to_s + "/public/system/#{name.underscore.pluralize}/:id/:style.:extension"
      end

      def self.image_url
       "/system/#{name.underscore.pluralize}/:id/:style.:extension"
      end

      has_mongoid_attached_file :image,:convert_options => { :all => '-strip -colorspace RGB'}, :styles => styles_dict(), :path => image_path(), :url => image_url()
    end

    # - file name niftify
    #see http://davesouth.org/stories/make-url-friendly-filenames-in-paperclip-attachments
    recipient.before_post_process :transliterate_file_name
    def transliterate_file_name
      extension = File.extname(image_file_name).gsub(/^\.+/, '')
      filename = image_file_name.gsub(/\.#{extension}$/, '')
        self.image.instance_write(:file_name, "#{transliterate(filename)}.#{transliterate(extension)}")
    end

    def transliterate(str)
      # Based on permalink_fu by Rick Olsen
      # Escape str by transliterating to UTF-8 with Iconv
      s = Iconv.iconv('ascii//ignore//translit', 'utf-8', str).to_s

      # Downcase string
      s.downcase!
      # Remove apostrophes so isn't changes to isnt
      s.gsub!(/'/, '')
      # Replace any non-letter or non-number character with a space
      s.gsub!(/[^A-Za-z0-9가-힣]+/, ' ')
      # Remove spaces from beginning and end of string
      s.strip!
      # Replace groups of spaces with single hyphen
      s.gsub!(/\ +/, '-')

      return s
    end
  end
end
