class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
    item = Item.find_by(id: item_id)
    if self.items.include?(item)
      line_item = self.line_items.where(item_id: item_id).first
      line_item.quantity += 1
    else
      line_item = LineItem.new(cart_id: self.id, item_id: item.id)
    end
    line_item
  end

  def total
    sum = 0
    self.items.each {|item| sum += item.price}
    sum
  end
end
