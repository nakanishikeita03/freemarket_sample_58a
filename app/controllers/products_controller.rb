class ProductsController < ApplicationController

  before_action :authenticate_user!,       only:[:new,:create,:destroy,:edit,:update]
  before_action :set_products_instance,    only:[:show,:destroy]
  before_action :set_products,             only:[:edit,:destroy,:update]
  before_action :image_params,             only:[:update]
  
  def index
    @products = Product.includes(:images).where(status: 0).order("created_at DESC").limit(10)    #複数の指定なので返り値は配列
  end

  def category
    @products = Product.page(params[:page]).per(100)
  end

  def new
    @product = Product.new
    @item_image = @product.images.build
  end


  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to controller: :products, action: :index
    else
      redirect_to({action: :new}, notice: '出品できません')
    end
end


  def destroy
    @product.destroy if @product.user_id == current_user.id
    redirect_to controller: :products, action: :index
  end



  def edit
    require 'aws-sdk'

    if Rails.env.production?
      client = Aws::S3::Client.new(
                              region: 'ap-northeast-1',
                              access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                              secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
                              )
    else
      @product= Product.find(params[:id])
      @images = @product.images.order(id: "DESC")
    end
  end


  def show
    @product = Product.find(params[:id])
    @images = @product.images
    @image = @images.first
  end



  def update
    if @images.present? && @product.update(product_params)
      beforeimgs=Image.where(product_id: @product.id)
      beforeimgs.each do |beforeimg|
        beforeimg.destroy
      end
      if @product.update(product_params)
        redirect_to root_path
      else
        flash.now[:alert] = '更新できません'
        render 'edit'
      end
    else
      flash.now[:alert] = '写真がありません'
      render 'edit'
    end
  end



private

  def product_params
    params.require(:product).permit(:name, :detail, :category, :price, :status, :state, :city, :delivery, :delivery_time, :fee_payer, images_attributes: [:image]).merge(user_id: current_user.id)
  end
  
  def image_params
    @images = params.require(:product).permit(images_attributes: [:image])
  end

  def set_products_instance
    @product = Product.new
  end

  def set_products
    @product = Product.find(params[:id])
  end

end
