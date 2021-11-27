class Car < ApplicationRecord
    has_one_attached :car_image
    belongs_to :user
    has_rich_text :content
end

