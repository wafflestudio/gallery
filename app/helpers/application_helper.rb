module ApplicationHelper

  def photo_uploadify
    # Putting the uploadify trigger script in the helper gives us
    # full access to the view and native rails objects without having
    # to set javascript variables.
    #
    # ScriptData:
    #   Sets the http headers to accept javascript plus adds
    #   the session key and authenticity token for XSS protection.
    #   The "FlashSessionCookieMiddleware" rack module deconstructs these 
    #   parameters into something Rails will actually use.

    session_key_name = Rails.application.config.session_options[:key]
    %Q{

    <script type='text/javascript'>
      $(document).ready(function() {
        $('#photo_upload').uploadify({
          script          : '#{project_project_images_path(@story)}',
          fileDataName    : 'photo[image]',
          uploader        : '/uploadify/uploadify.swf',
          cancelImg       : '/uploadify/cancel.png',
          fileDesc        : 'Images',
          fileExt         : '*.jpg;*.jpeg;*.png;*.gif',
          multi           : true,
          auto            : true,
          buttonText      : 'upload Photos',
          scriptData      : {
            '_http_accept': 'application/javascript',
            '#{session_key_name}' : encodeURIComponent('#{u(cookies[session_key_name])}'),
            'authenticity_token'  : encodeURIComponent('#{u(form_authenticity_token)}')
          },
          onComplete  : function(event, ID, fileObj, response, data){ eval(response) },
          onError     : function(event, ID, fileObj, errorObj){ 
            alert(errorObj.type + ' Error: ' + errorObj.info);
          }
        });
      });
    </script>

    }.gsub(/[\n ]+/, ' ').strip.html_safe
  end
end
