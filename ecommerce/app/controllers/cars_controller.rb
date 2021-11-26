class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show] #ACÁ PONER PARA COMRPAR DESPUÉS
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /cars or /cars.json
  def index
    
    @cars = Car.all

    i = 0
    @array_four_cars = []
    four_cars = []

    @cars.each do |car|
      four_cars.push(car)
      i+=1
      if i == 4
          @array_four_cars.push(four_cars)
          four_cars = []
          
          i = 0
      end
    end
    if i != 0
      @array_four_cars.push(four_cars)
      four_cars = []
    end

    @last_index = @array_four_cars.count
    @last_index -= 1
    
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    #@car = Car.new
    @car = current_user.cars.build
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    
    #@car = Car.new(car_params)
    @car = current_user.cars.build(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @car = current_user.cars.find_by(id: params[:id])
    redirect_to cars_path, notice: "Not autorithized to edit this car." if @car.nil?
  end

  def active_posts
    @cars = Car.all

    i = 0
    @array_four_cars = []
    four_cars = []

    @cars.each do |car|
      if car.user_id == current_user.id
        four_cars.push(car)
        i+=1
        if i == 4
            @array_four_cars.push(four_cars)
            four_cars = []
            
            i = 0
        end
      end
    end
    if i != 0
      @array_four_cars.push(four_cars)
      four_cars = []
    end

    @last_index = @array_four_cars.count
    @last_index -= 1
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:car_image, :car_model, :car_class, :car_type, :body, :capacity, :manufacturer, :price, :user_id)
    end
end
