class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy answer ]
  before_action :set_car, except: %i[ index answer ]
  before_action :correct_user, only: [:answer]
  before_action :authenticate_user!, only: [:new]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = @car.questions.new
  end

  # GET /questions/1/edit
  def edit
    @car = @question.car
  end

  # POST /questions or /questions.json
  def create
    @question = @car.questions.new(question_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @question.save
        format.html { redirect_to car_path(@car), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    @question.update(question_params)
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to car_path(@car), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    if @question.destroy
      flash[:notice] = "Question was successfully destroyed."
      redirect_to car_path(@car)
    end
  end

  def correct_user
    current_car = current_user.cars.find_by(id: @question.car_id)
    redirect_to cars_path, notice: "Not autorithized to answer this question." if current_car.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_car
      @car = Car.find(params[:car_id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      if params.require(:question).permit(:answer)
        params.require(:question).permit(:title, :content, :answer)
      else 
        params.require(:question).permit(:title, :content)
      end
    end
end
