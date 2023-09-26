class OrderDetail < ApplicationRecord
  belongs_to :order

  belongs_to :item
  enum production_status: {
      untouched: 0,
      waiting: 1,
      working: 2,
      completed: 3
  }
  
  def subtotal
    item.with_tax_price * amount
  end
end
