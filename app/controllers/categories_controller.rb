class CategoriesController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_new_category, only: [:new, :create]

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.json {render json: @category, status: :ok }
        format.js
        format.html {redirect_to products_path, flash: {success: "Category Saved Successfully"}}
      else
        format.json {render json: @category.errors.full_messages, status: :unprocessable_entity}
        format.js
        format.html {redirect_to products_path, flash: {error: @category.errors.full_messages }}
      end
    end
  end


private
  def category_params
    params.require(:category).permit(:name,:desc)
  end

  def set_new_category
    @category = Category.new
  end

end
