class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_new_product, only: [:index, :new, :create]
  require 'will_paginate/array'

  def index
      products = Product.order(created_at: :asc) if params[:order] == "latest"
      products = Product.order(name: :asc) if params[:order] == "project_title"
      products = Product.all if params[:order].nil?
      @products = products.page(params[:page]).per_page(2)
      respond_to do |format|
        format.json {render json: @products, status: :ok }
        format.js
        format.html
      end
  end

  def create
    @product_created = Product.new(product_params)
    respond_to do |format|
      if @product_created.save
        format.json {render json: @product_created, status: :created }
        format.js
        format.html {redirect_to :controller=> "products", :action => "index", flash: { success: "Product saved Successfully"}}
      else
        format.json {render json: @product_created.errors.full_messages, status: :unprocessable_entity }
        format.js
        format.html {redirect_to products_path, flash: { error: @product_created.errors.full_messages }}
      end
    end
  end

  private

  def product_params
		params.require(:product).permit(:user_id, :category_id, :name, :price)
	end

  def set_new_product
    @product = Product.new
  end

end
