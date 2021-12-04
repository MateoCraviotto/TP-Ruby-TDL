class AddBuyerIdToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :buyer_id, :integer
  end
end
