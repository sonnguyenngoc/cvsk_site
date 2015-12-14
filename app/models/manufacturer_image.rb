class ManufacturerImage < ActiveRecord::Base
  mount_uploader :listing_image_url, AvatarUploader
  validates :listing_image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  belongs_to :manufacturer
end
