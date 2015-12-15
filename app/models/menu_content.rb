class MenuContent < ActiveRecord::Base
  has_many :listing_menu_products
  accepts_nested_attributes_for :listing_menu_products, :reject_if => lambda { |a| a[:product_id].blank? }, :allow_destroy => true
end
