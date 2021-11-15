class Product < ApplicationRecord
    require 'csv'
    require 'activerecord-import/base'
    require 'activerecord-import/active_record/adapters/sqlite3_adapter'

    def self.my_import(file)
        products = []
        CSV.foreach(file.path, headers: true) do |row|
            products << Product.new(row.to_h)
        end
        Product.import products, recursive: true
    end
end
