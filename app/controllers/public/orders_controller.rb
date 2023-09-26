class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
    @orders = Order.where(customer_id: current_customer)

  end

  def show
    @order = Order.find(params[:id])
    if @order.customer_id != current_customer.id
      redirect_to root_path
    end
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @delivery_charge = 800
    @selected_payment_method = params[:order][:payment_method]
    ary = []
    @cart_items.each do |cart_item|
      ary << cart_item.item.with_tax_price*cart_item.amount
    end
    @cart_items_price = ary.sum

    @total_price = @delivery_charge + @cart_items_price
    @order = Order.new(order_params)
    if params[:order][:address_type] == "customer_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_type] == "registered_address"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    end
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.purchase_price = cart_item.item.with_tax_price
      @order_details.amount = cart_item.amount
      @order_details.production_status = 0

      @order_details.save
    end
    CartItem.destroy_all
    redirect_to '/orders/complete'
  end
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method , :delivery_charge, :status, :total_price)
  end
end

