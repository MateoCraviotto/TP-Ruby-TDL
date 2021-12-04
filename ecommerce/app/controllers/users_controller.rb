class UsersController < ApplicationController
#before_filter :authenticate_user!

	def show
		@user = User.find(params[:id])
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
end
