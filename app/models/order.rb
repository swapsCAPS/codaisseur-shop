class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items

  PAYMENT_METHODS = ["iDeal", "PayPal", "Credit Card"]

end
