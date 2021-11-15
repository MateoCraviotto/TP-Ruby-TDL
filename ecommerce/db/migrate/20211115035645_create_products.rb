class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :model
      t.string :car_class
      t.string :car_type
      t.string :body
      t.string :capacity
      t.string :manufacturer
      t.string :price

      t.timestamps
    end
  end
end
