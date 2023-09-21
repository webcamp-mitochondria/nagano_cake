class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :items
  
  enum production_status: { not_ready: 0, ready: 1, doing: 2, done: 3 }
end
