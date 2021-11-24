class AddRegistrationFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, index: true, unique: false
    add_column :users, :last_name, :string, index: true, unique: false
    add_column :users, :username, :string, index: true, unique: true
  end
end
