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

    def image()
        img_for_html = self.car_class+"/"+self.model.downcase+".png"
        img_path = "app/assets/images/"+img_for_html
        if File.exist?(img_path)
            return img_path
        end
        return nil
    end
end