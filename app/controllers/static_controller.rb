class StaticController < ApplicationController

  def index
    @classes = Classroom.scoped

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classrooms }
    end
  end
end
