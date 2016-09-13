class LineItemsController < ApplicationController
  def create
    current_user.current_cart=(Cart.create) if current_user.current_cart == nil
    current_cart.add_item(params[:item_id])
    redirect_to cart_path(current_cart)
  end
end
