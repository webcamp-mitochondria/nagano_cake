class Admin::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :asc).page(params[:page]).per(10)
  end
end
