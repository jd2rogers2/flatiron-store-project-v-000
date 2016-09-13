class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts

  def current_cart
    Cart.find_by(id: self.current_cart_id)
  end

  def current_cart=(cart)
    if cart != nil
      self.carts << cart if !self.carts.include?(cart)
      self.current_cart_id = self.carts.find_by(id: cart.id).id
    else
      self.current_cart_id = nil
    end
    self.save
  end
end
