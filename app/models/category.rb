class Category < ActiveRecord::Base
  validates :title, presence: true, :uniqueness => true
  
  has_many :parent_categories, dependent: :destroy
  has_many :parent, through: :parent_categories, source: :parent
  has_many :child_categories, class_name: "ParentCategory", foreign_key: "parent_id", dependent: :destroy
  has_many :children, through: :child_categories, source: :category
  
  has_many :products
end
