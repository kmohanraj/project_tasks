class Product < ApplicationRecord
  belongs_to :user
  
  belongs_to :category
  
  before_validation :set_product_date, on: :create
  
  def set_product_date
	self.date = Date.today if self.date.blank?
  end

end
