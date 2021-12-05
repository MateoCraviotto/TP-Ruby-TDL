# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
user = User.create! :username => 'admin',
                    :first_name => 'Legendary',
                    :last_name => 'Motorsports',
                    :email => 'legendary@motorsports.com',
                    :password => '123456',
                    :password_confirmation => '123456'

admin = User.find_by(:username => "admin")
admin.my_import("../vehiculos/vehicles.csv")