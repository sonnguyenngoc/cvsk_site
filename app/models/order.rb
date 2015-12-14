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
 
end
