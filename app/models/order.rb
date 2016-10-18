class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items

  # validates :user, presence: true
  # validates :payment_method, presence: true

  PAYMENT_METHODS = ["iDeal", "PayPal", "Credit Card"]

  def get_total
    total = 0
    line_items.each do |li|
      total += li.get_total
    end
    total
  end

end
