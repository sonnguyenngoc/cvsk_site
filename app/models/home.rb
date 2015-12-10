class Home < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
  belongs_to :manufacturer
  belongs_to :slide_show
  
end
