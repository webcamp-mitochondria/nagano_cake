class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum status: { waiting_payment: 0, payment_confirmation: 1, in_production: 2, preparation_shipping: 3, shipped: 4 }

  def billing_amount
    self.total_price + self.delivery_charge
  end
end
