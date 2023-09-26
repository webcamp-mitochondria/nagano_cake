class Public::ItemsController < ApplicationController
  def index
    @search = "False"
    @genre_search = "False"
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @genre_items_count = @genre.items.count
      @items = @genre.items.page(params[:page]).per(8)
      @all_items = @genre.items.all.page(params[:page]).per(8)
      @genre_search = "True"
    else
      @items = Item.page(params[:page]).per(8)
      @all_items = Item.all.page(params[:page]).per(8)
    end

    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    #@price = @item.price_without_tax
    @genres = Genre.all
    @cart_item = CartItem
  end
end
