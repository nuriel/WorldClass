class QuestionsController < ApplicationController
  respond_to :js, :json

  def index
    @classroom = Classroom.find(params[:classroom_id])
    @questions = @classroom.questions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.create(params[:question])
    @classroom = Classroom.find(@question.classroom_id)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @classroom, notice: 'Question was successfully created.' }
        format.js { render 'create'}
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { redirect_to @classroom, notice: "#{@question.errors}" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    classroom = @question.classroom
    @question.destroy

    respond_to do |format|
      format.html { redirect_to classroom_url(classroom) }
      format.json { head :no_content }
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @question = Question.find(params[:id])
    @question.add_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end
end
