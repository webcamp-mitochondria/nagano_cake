class Public::CartItemsController < ApplicationController
  def index
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  def create
    @cart_item = CartItem.new
    @cart_item.customer_id = current_user.id
    
  end
end
