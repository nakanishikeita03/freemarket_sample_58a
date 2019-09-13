class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new,:create,:destroy,:edit,:update]

  def index
    @products = Product.where(status: 0).order("created_at DESC").limit(10)#複数の指定なので返り値は配列
  end


  def new
  end



  def create
      Product.create(product_params)
    # Product.create(user_id: current_user_id,name: product_params[:name],detail: product_params[:text],category: product_params[:category],price: product_params[:price],status: product_params[:status],state: product_params[:state],city: product_params[:city],delivery: product_params[:delivery])
  end


  def destroy
    product = Product.find(params[:id])
    product.destroy if product.user_id == current_user.id
  end



  def edit
    @product = Product.find(params[:id])
  end



  def show
    @product = Product.find(params[:id])
  end



  def update
    product = Tweet.find(params[:id])
    product.update(tweet_params) if product.user_id == current_user.id
  end



private

  def product_params
    params.require(:product).permit(:name, :detail, :category, :price, :status, :state, :city, :delivery, :image).merge(user_id: current_user.id)
  end


end
