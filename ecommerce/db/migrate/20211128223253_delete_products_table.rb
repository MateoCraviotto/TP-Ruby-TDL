class DeleteProductsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :products
  end
end
