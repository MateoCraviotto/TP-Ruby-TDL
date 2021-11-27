class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :car_model
      t.string :car_class
      t.string :car_type
      t.string :body
      t.string :capacity
      t.string :manufacturer
      t.integer :price

      t.timestamps
    end
  end
end
