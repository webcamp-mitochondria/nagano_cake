class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @product_total = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(production_status: 1) if @order.status == "paid_up"
      redirect_to request.referer
    else
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
