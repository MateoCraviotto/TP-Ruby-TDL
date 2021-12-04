class Question < ApplicationRecord
    validates :car_id, :user_id, :presence => true
    has_rich_text :content
    has_rich_text :answer
    belongs_to :car
    belongs_to :user
end