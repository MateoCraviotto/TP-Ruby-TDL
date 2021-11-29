class AddCarIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :car_id, :integer
  end
end
