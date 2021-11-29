class Question < ApplicationRecord
    validates :car_id, :user_id, :presence => true
    has_rich_text :content
    belongs_to :car
    belongs_to :user
end