class Post < ActiveRecord::Base
  validates :title, presence: true, :uniqueness => true
  validates :tag, presence: true
  validates :content, presence: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  
  mount_uploader :image_url, AvatarUploader
  belongs_to :tag
end
