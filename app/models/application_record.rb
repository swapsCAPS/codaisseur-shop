class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def euro_price price
    number_to_currency price, unit: '€'
  end

end
