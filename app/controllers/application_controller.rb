class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def current_cart
  #   # binding.pry
  #   current_user.current_cart ||= Cart.create
  #   current_user.save
  #   current_user.current_cart
  #   # binding.pry
  # end

end
