class Post < ActiveRecord::Base
  mount_uploader :image_url, AvatarUploader
  validates :title, presence: true, :uniqueness => true
  validates :tag, presence: true
  validates :content, presence: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  belongs_to :tag
  has_many :product_of_events
  accepts_nested_attributes_for :product_of_events, :reject_if => lambda { |a| a[:product_id].blank? }, :allow_destroy => true
end
