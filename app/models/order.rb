class Order < ApplicationRecord
  
  has_many :order_items, dependent: :destroy
  
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1}
  
  validates :payment_method, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
end
