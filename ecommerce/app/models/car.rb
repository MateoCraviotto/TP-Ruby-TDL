require "open_exchange_rates"

class Car < ApplicationRecord
    has_one_attached :car_image
    belongs_to :user, optional: true
    has_many :questions

    def exchange_price(currency)
        exchange = OpenExchangeRates::Rates.new(:app_id => "d048914d53b24d148811eb19ebaa047b")
        return exchange.convert(self.price, :from => "USD", :to => currency)
    end

    def image_path()
        model = self.car_model.downcase
        model_aux = model.gsub(" ", "-").delete("/")
        path_for_html = self.car_class+"/"+model_aux+".png"
        path = "./app/assets/images/"+path_for_html
        if File.exist?(path)
            return path, path_for_html
        end
        return nil, nil
    end
end