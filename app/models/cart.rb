class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
    item = Item.find_by(id: item_id)
    if self.items.include?(item)
      line_item = self.line_items.where(item_id: item_id).first
      line_item.quantity += 1
      line_item.save
    else
      self.items << item
      self.save
      line_item = LineItem.new(cart_id: self.id, item_id: item.id)
    end
    line_item
  end

  def total
    sum = 0
    self.items.each do |item|
      line_item = LineItem.find_by(item_id: item.id, cart_id: self.id)
      sum += (line_item.quantity * item.price)
    end
    sum
  end

  def checkout
    self.line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
    self.user.current_cart = nil
    self.user.save
  end
end
