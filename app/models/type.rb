class Type < ActiveRecord::Base
  validates :title, presence: true, :uniqueness => true
end
