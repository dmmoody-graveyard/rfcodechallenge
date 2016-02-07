class Order < ActiveRecord::Base
  belongs_to :purchaser
  has_many :item_orders
  has_many :items, through: :item_orders
end