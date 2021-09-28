class Address < ApplicationRecord
    belongs_to :customer
    
    def full_address
      '〒' + postal_code + ' ' + address + ' ' + name
    end
    
    validates :name, presence: true
    validates :postal_code, length: {is: 7}, numericality: {only_integer: true}
    validates :address, presence: true
end
