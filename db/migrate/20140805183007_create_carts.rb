class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |c|
      c.string :name
      c.integer :user_id
      c.string :status
    end
  end
end
