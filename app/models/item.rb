class Item < ApplicationRecord
  attachment :image
  
  has_many :cart_items
  has_many :order_items
  
  belongs_to :genre, optional: true
  
  def add_tax_price
    (self.price * 1.10).round
  end
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end
