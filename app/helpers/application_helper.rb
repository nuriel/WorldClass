module ApplicationHelper
  def current_user_is_teacher
    current_user && current_user.is_teacher
  end

  # broadcast a message
  #def broadcast(channel, &block)
  #  message = {:channel => channel, :data => capture(&block)}
  #  uri = URI.parse( Rails.env.production? ? 'http://worldclasssocket.herokuapp.com/faye' : 'http://localhost:9292/faye')
  #  Net::HTTP.post_form(uri, :message => message.to_json)
  #end

  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    %Q{<iframe title="World Class video player - youtube" id="player" class="video_iframe" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }?enablejsapi=1" frameborder="0" allowfullscreen></iframe>}

  end
end
