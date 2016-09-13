class LineItemsController < ApplicationController
  def create
    if current_user.current_cart == nil
      new_cart = Cart.create
      current_user.carts << new_cart
      current_user.current_cart=(new_cart)
    end
    item = Item.find_by(id: params[:item_id])
    current_cart.add_item(item.id)
    current_cart.save
    current_user.save
    redirect_to cart_path(current_cart)
  end
  # add item method in cart model working correctly?
  # feeling like that should do most of this
end
