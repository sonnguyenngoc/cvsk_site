class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  
  before_validation :update_current_price_from_product
  
  def update_current_price_from_product
    if self.price.nil?
        self.price = product.price
    end    
  end
  
  def total
    price*quantity
  end
  
end
