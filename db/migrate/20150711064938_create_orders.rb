class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :purchaser_id
    end
  end
end
