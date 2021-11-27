class AddSellerIdToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :user_id, :integer
    add_index :cars, :user_id
  end
end
