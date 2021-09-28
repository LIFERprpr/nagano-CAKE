class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :addresses, dependent: :destroy

  def active_for_authentication?
    super && (self.is_active == true)
  end
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, length: {is: 7}, numericality: {only_integer: true}
  validates :address, presence: true
  validates :telephone_number, length: {in: 10..11}, numericality: {only_integer: true}
  
end
