class Question < ApplicationRecord
    validates :car_id, :user_id, :presence => true
    belongs_to :car
    belongs_to :user
end