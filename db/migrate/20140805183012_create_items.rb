class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |c|
      c.string :title
      c.integer :inventory
      c.decimal :price, precision: 4, scale:2
      c.integer :category_id
    end
  end
end
