class SearchesController < ApplicationController
  def search
    @search = "True"
    @word = params[:word]
    search_items = Item.where("name LIKE?","%#{@word}%")
    @shearch_count = search_items.count
    if admin_signed_in?
      @items = search_items.page(params[:page]).per(10)
      render 'admin/items/index'
    else
      if params[:genre_id]
        genre = Genre.find(params[:genre_id])
        @items = genre.items
      else
        @items = search_items.page(params[:page]).per(8)
      end

      @all_items = search_items.all.page(params[:page]).per(8)
      @genres = Genre.all
      render 'public/items/index'
    end
  end

end