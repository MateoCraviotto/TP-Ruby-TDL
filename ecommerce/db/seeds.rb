# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# This file should contain all the record creation needed to seed the database with its default values.
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(:first_name => "Legendary",
                :last_name => "Motorsports",
                :username => "admin",
                :email => "legendary@motorsports.com",
                :password => "123456")

User.create!(:first_name => "Legendary",
            :last_name => "Motorsports",
            :username => "admin",
            :email => "legendary@motorsports.com",
            :password => "123456")

admin = User.find_by(:username => "admin")
admin.import_cars("../vehiculos/vehicles.csv")