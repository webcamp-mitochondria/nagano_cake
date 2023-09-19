class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      genre = Genre.find(params[:genre_id])
      @items = genre.items
    else
      @items = Item.page(params[:page]).per(8)
    end

    @all_items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    #@price = @item.price_without_tax
    @genres = Genre.all
    @cart_item = CartItem
  end
end
