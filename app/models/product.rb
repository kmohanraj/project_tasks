class Product < ApplicationRecord
  belongs_to :user
  
  belongs_to :category
  
  before_validation :set_product_date, on: :create
  scope :recent_project, -> { order("created_at DESC")}
  scope :order_project_title, -> { order("name ASC")}
  scope :order_category_name, -> { order(category_id: :asc)}
  scope :order_user_name, -> { order("user_id ASC")}

  def set_product_date
	self.date = Date.today if self.date.blank?
  end

end
