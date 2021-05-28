class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def subtotal
    item.((price * 1.1).floor) * quantity
  end
  
end
