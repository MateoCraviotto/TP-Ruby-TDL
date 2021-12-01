require "open_exchange_rates"

class Car < ApplicationRecord
    has_one_attached :car_image
    belongs_to :user
    has_many :questions

    def exchange_price(currency)
        exchange = OpenExchangeRates::Rates.new(:app_id => "d048914d53b24d148811eb19ebaa047b")
        return exchange.convert(self.price, :from => "USD", :to => currency)
    end
end