class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_type] == "0"
      @order.postal_code = current_costomer.postal_code
      @order.address = current_costomer.address
      @order.name = current_costomer.first_name + current_costomer.last_name
    elsif params[:order][:address_type] == "1"
      @address = Address.find(params[:order][:address_type])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_type] == "2"
      @order.customer_id = current_customer.id
    end 
    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm

  end

  def complete
  end

  def create
  end
  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :delivery_charge, :amount, :customer_id , :status)
  end
end
