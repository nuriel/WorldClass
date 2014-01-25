class StaticController < ApplicationController

  def index
    if user_signed_in && current_user.is_teacher
      @users = User.all
      @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.lat
        marker.lng user.lng
      end
    end

    gon.users = @users

    @classes = Classroom.scoped

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classrooms }
    end
  end
end
