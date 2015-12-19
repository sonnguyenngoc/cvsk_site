class Product < ActiveRecord::Base
  mount_uploader :image_url, AvatarUploader
  
  validates :name, presence: true, :uniqueness => true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :category, :manufacturer, presence: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  
  belongs_to :manufacturer
  belongs_to :category
  has_many :orders
  has_many :order_details, dependent: :destroy
  
  
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  #...
  private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
