class StaticController < ApplicationController

  def index
    build_map_json

    @classes = Classroom.scoped

    respond_to do |format|
      format.html { gon.map_json = @json } # index.html.erb
      format.json { render json: @json }
    end
  end

  private
  def build_map_json
    if current_user && current_user.is_teacher
      @users = User.all
    elsif current_user
      @users = current_user
    end

    @json  = Gmaps4rails.build_markers @users do |user, marker|
      marker.lat user.lat ? user.lat : 0
      marker.lng user.lng ? user.lng : 0
      marker.infowindow render_to_string(:partial => "/users/info_window", :locals => { :user => user}).gsub(/\n/, '').gsub(/"/, '\"')
      marker.picture({
                         :url    => view_context.image_path("map_user.png"),
                         :width  => "36",
                         :height => "36"
                     })
      marker.title   "#{user.name} - #{user.status}"
      marker.json({:id => user.id, :status => user.status })
    end
  end

end
