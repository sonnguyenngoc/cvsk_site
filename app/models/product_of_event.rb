class ProductOfEvent < ActiveRecord::Base
  belongs_to :post
  belongs_to :product
end
