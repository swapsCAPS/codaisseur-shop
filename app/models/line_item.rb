class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def get_total
    amount * product.price
  end
end
