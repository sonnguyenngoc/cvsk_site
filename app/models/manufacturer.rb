class Manufacturer < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true, :uniqueness => true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :phone, presence: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  
  mount_uploader :image_url, AvatarUploader
  has_many :products
end
