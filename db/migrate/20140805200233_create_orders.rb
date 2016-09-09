class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |c|
      c.string :name
    end
  end
end
