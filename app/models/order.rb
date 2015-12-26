class Order < ActiveRecord::Base
  has_many :order_details, dependent: :destroy
  belongs_to :type
  accepts_nested_attributes_for :order_details, :reject_if => lambda { |a| a[:product_id].blank? }, :allow_destroy => true
  
  def total
    amount = 0.0
    order_details.each do |od|
      amount += od.total
    end
    return amount
  end
  
  def save_from_cart(cart)
    cart.line_items.each do |li|
      self.order_details.create(product_id: li.product_id, quantity: li.quantity)
    end
  end
 
end
