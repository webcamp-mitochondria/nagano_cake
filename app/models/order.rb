class Order < ApplicationRecord
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: {
    waiting: 0,
    paid_up: 1,
    making: 2,
    preparing: 3,
    shippend: 4

  }
  has_many :order_details, dependent: :destroy
end
