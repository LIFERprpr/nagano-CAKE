class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def total_price(amount, item)
    total = amount.to_i * item.add_tax_price
    return total
  end
end
