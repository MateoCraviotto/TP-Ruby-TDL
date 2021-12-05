class UsersController < ApplicationController
#before_filter :authenticate_user!

	def show
		@user = User.find(params[:id])
	end

	def active_posts
		@cars = Car.all.where(is_for_sale: true, user_id: current_user.id)
	
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

	def purchase_history
		@cars = Car.all.where(is_for_sale: false, buyer_id: current_user.id)
	
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


	def sale_history
		@cars = Car.all.where(is_for_sale: false, user_id: current_user.id)
		@gross_revenue = sum_of_car_prices(@cars)

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

	
	private

		def sum_of_car_prices(cars)
			@total = 0
			@cars.each do |car|
				@total += car.price
			end
			return @total
		end
end
