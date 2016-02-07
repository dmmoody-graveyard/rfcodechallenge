class ItemOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :items
end