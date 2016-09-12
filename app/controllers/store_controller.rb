class StoreController < ApplicationController
  def index
    @categories = Category.all
    # binding.pry
    @items = Item.all.where("inventory > ?", 0)
  end
end
