class ProductsController < ApplicationController

  before_action :authenticate_user!,      only: [:new,:create,:destroy,:edit,:update]
  before_action :set_products_instance,   only:[:edit,:show]
  before_action :set_products,            only:[:destroy,:update]

  def index
    @products = Product.includes(:images).where(status: 0).order("created_at DESC").limit(10)    #複数の指定なので返り値は配列
    
  end


  def new
  end



  def create
      Product.create(product_params)
  end


  def destroy
    product.destroy if product.user_id == current_user.id
  end



  def edit

  end



  def show
    
  end



  def update
    product.update(product_params) if product.user_id == current_user.id
  end



private

  def product_params
    params.require(:product).permit(:name, :detail, :category, :price, :status, :state, :city, :delivery, :image).merge(user_id: current_user.id)
  end

  def set_products_instance
    @product = Product.find(params[:id])
  end

  def set_products
    product = Product.find(params[:id])
  end


end
