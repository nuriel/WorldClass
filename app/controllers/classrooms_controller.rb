class ClassroomsController < ApplicationController
  before_filter :authenticate_user!

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = Classroom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classrooms }
    end
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
    @classroom = Classroom.find(params[:id])
    gon.questions = @classroom.questions.order(:time).map { |q| [q.time, 1 + q.reputation_for(:votes).to_i + q.answers.count*0.5] }
    totalArr = Array.new
    gon.questions.each do |q|
      index = q[0].to_i / 10
      totalArr[index] = totalArr[index].blank? ? 1 : totalArr[index] + 1;
    end

    gon.qpm = totalArr.each_with_index.map { |total,i| [i*10, total.to_i] }

    # get the 'hottest questions'
    if current_user_is_teacher
      @questions = @classroom.questions.find_with_reputation(:votes, :all, order: 'votes desc')
    else
      @questions = @classroom.questions.order('updated_at DESC').all
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/new
  # GET /classrooms/new.json
  def new
    @classroom = Classroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/1/edit
  def edit
    @classroom = Classroom.find(params[:id])
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(params[:classroom])

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: 'Classroom was successfully created.' }
        format.json { render json: @classroom, status: :created, location: @classroom }
      else
        format.html { render action: "new" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.json
  def update
    @classroom = Classroom.find(params[:id])

    respond_to do |format|
      if @classroom.update_attributes(params[:classroom])
        format.html { redirect_to @classroom, notice: 'Classroom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to classrooms_url }
      format.json { head :no_content }
    end
  end

  def control_player
    Pusher.trigger('classroom', 'control_player' , { :type => params[:type] || 'play', :seconds => params[:seconds].to_i})
  end
end
