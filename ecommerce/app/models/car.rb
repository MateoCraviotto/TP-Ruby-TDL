class Car < ApplicationRecord
    has_one_attached :car_image
    belongs_to :user
end
