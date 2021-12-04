class AddIsForSaleToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :is_for_sale, :boolean
  end
end
