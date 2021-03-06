class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :item_orders
  has_many :orders, through: :item_orders
end