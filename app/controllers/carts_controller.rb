class CartsController < ApplicationController
  def show
    if params[:checkout] == "true"
      current_cart.checkout
      redirect_to cart_path
    end
  end
end
