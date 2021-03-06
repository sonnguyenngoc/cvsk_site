class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products, :through => :line_items
  has_many :manufacturers, :through => :products
  
  def remove_item(lt_id)
    self.line_items.where(id: lt_id).destroy_all
  end
  
  def remove_manu(manu_id)
    self.line_items.includes(:product).where(products: {manufacturer_id: manu_id}).destroy_all
  end
  
  def sum_total
    amount = 0.0
    line_items.each do |od|
      amount += od.total
    end
    return amount
  end
  
  def total_by_manufacturer(m_id)
    amount = 0.0
    line_items.includes(:product).where(products: {manufacturer_id: m_id}).each do |od|
      amount += od.total
    end
    return amount
  end
  
end
