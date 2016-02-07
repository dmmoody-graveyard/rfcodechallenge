class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders, id: false do |t|
      t.belongs_to :item, index: true
      t.belongs_to :order, index: true
      t.integer :item_quantity
    end
  end
end
