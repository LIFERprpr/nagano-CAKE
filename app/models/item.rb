class Item < ApplicationRecord
  attachment :image
  
  belongs_to :genre, optional: true
  
  def add_tax_price
    (self.price * 1.10).round
  end
end
