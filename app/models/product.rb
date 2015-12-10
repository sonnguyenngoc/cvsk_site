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
end
