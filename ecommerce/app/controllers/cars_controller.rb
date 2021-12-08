class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  before_action :sort_by_init
  helper_method :sort_by_get_helper, :sort_by_price_helper, :sort_by_car_model_helper, :sort_by_manufacturer_helper,
                :sort_by_order_asc_helper, :sort_by_order_desc_helper
  
  

  # GET /cars or /cars.json
  def index

    @cars = Car.all.where(is_for_sale: true).order(session[:sort_by_setting].to_sym => session[:sort_by_order].to_sym)


    @array_four_cars = []
    arrange_cars_in_four_cars(@cars, @array_four_cars)
    
    @last_index = @array_four_cars.size
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

  def buy
    car_id = buy_path().gsub( buy_path().tr("0-9","") , "").to_i
    @car = Car.find_by_id(car_id)
  end

  def confirm_purchase
    car_id = confirm_purchase_path().gsub( confirm_purchase_path().tr("0-9","") , "").to_i
    @car = Car.find_by_id(car_id)

    @car.update(is_for_sale: false)
    @car.update(buyer_id: current_user.id)
    @car.update(purchased_at: Time.current)

    redirect_to cars_path(), notice: "Car was successfully purchased."
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
      format.html { redirect_to active_posts_path, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @car = current_user.cars.find_by(id: params[:id])
    redirect_to cars_path, notice: "Not autorithized to edit this car." if @car.nil?
  end

  def change_sort_by_setting
    setting_id = change_sort_by_setting_path().gsub( change_sort_by_setting_path().tr("0-9","") , "").to_i

    if setting_id == 1
      sort_by_car_model_helper()
      sort_by_order_asc_helper()
    elsif setting_id == 2
      sort_by_car_model_helper()
      sort_by_order_desc_helper()
    elsif setting_id == 3
      sort_by_manufacturer_helper()
      sort_by_order_asc_helper()
    elsif setting_id == 4
      sort_by_manufacturer_helper()
      sort_by_order_desc_helper()
    elsif setting_id == 5
      sort_by_price_helper()
      sort_by_order_desc_helper()
    else
      sort_by_price_helper()
      sort_by_order_asc_helper()
    end

    redirect_to cars_path
  end
  
  private

  
  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end
  
  #Por default va a ordenar por car_model
    def sort_by_init
      if session[:sort_by_setting].nil? || session[:sort_by_order].nil?
        session[:sort_by_setting] = "car_model"
        session[:sort_by_order] = "asc"
      end
    end
  
    def sort_by_get_helper
      session[:sort_by_setting]
    end
  
    def sort_by_price_helper
      session[:sort_by_setting] = "price"
    end

    def sort_by_car_model_helper
      session[:sort_by_setting] = "car_model"
    end

    def sort_by_manufacturer_helper
      session[:sort_by_setting] = "manufacturer"
    end

    def sort_by_order_asc_helper
      session[:sort_by_order] = "asc"
    end

    def sort_by_order_desc_helper
      session[:sort_by_order] = "desc"
    end

    def sort_by_current_setting(cars)
      cars.order(session[:sort_by_setting].to_sym => :desc)
    end

    def arrange_cars_in_four_cars(cars, array_four_cars)
      i = 0
      four_cars = []
  
      cars.each do |car|
        four_cars.push(car)
        i+=1
        if i == 4
            array_four_cars.push(four_cars)
            four_cars = []
            
            i = 0
        end
      end
      
      if i != 0
        array_four_cars.push(four_cars)
        four_cars = []
      end
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:car_image, :car_model, :car_class, :car_type, :body, :capacity, :manufacturer, :price, :user_id, :is_for_sale, :buyer_id, :purchased_at)
    end
end
