class Product < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :price, presence: true
  validates :user_id, presence: true
  # validates :images


  # copied these methods from codaisseurbnb
  def bargain?
    price < 30
  end

  def self.order_by_price
    order(:price)
  end
end
