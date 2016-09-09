class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |c|
      c.integer :quantity, default: 1
      c.integer :cart_id
      c.integer :item_id
    end
  end
end
