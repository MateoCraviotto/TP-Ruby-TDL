class AddPurchasedAtToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :purchased_at, :datetime
  end
end
