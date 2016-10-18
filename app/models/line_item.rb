class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  # Amount should be present and should be above 0
  validates :amount, presence: true
  validates_numericality_of :amount, greater_than: 0

  def get_total
    amount * product.price
  end
end
