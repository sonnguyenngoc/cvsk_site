class SlideShow < ActiveRecord::Base
  mount_uploader :image_url, AvatarUploader
  
  validates :title_1, presence: true, :uniqueness => true
  validates :title_2, :description, presence: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
