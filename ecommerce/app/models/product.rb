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
        model = self.model.downcase
        model_aux = model.gsub(" ", "-").delete("/")
        path_for_html = self.car_class+"/"+model_aux+".png"
        path = "app/assets/images/"+path_for_html
        if File.exist?(path)
            return path_for_html
        end
        return nil
    end
end