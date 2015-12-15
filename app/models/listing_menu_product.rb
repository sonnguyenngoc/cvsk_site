class ListingMenuProduct < ActiveRecord::Base
  belongs_to :menu_content
  belongs_to :product
end
