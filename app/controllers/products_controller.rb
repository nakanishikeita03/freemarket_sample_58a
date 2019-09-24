class ProductsController < ApplicationController

  before_action :authenticate_user!,       only:[:new,:create,:destroy,:edit,:update]
  before_action :set_products_instance,    only:[:show,:destroy]
  before_action :set_products,             only:[:edit,:destroy,:update]

  def index
    @products = Product.includes(:images).where(status: 0).order("created_at DESC").limit(10)    #複数の指定なので返り値は配列
    
  end


  def new
    @product = Product.new
    @item_image = @product.images.build
  end


  def create
    binding.pry
    @product = Product.new(product_params)
    if @product.save
      image_params[:images].each do |image|
        @product.images.create(image: image, product_id: @product.id) 
      
    end

    redirect_to controller: :products, action: :index
  end
end


  def destroy
    @product.destroy if @product.user_id == current_user.id
    redirect_to controller: :products, action: :index
  end



  def edit
    require 'base64'
    require 'aws-sdk'

    item_images_binary_datas = []
    if Rails.env.production?
      client = Aws::S3::Client.new(
                              region: 'ap-northeast-1',
                              access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                              secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
                              )
      @product.images.each do |image|
        binary_data = client.get_object(bucket: 'o-freemarket', key: image.image.file.path).body.read
        item_images_binary_datas << Base64.strict_encode64(binary_data)
      end
    else
      @product.images.each do |image|
        binary_data = File.read(image.image.file.path)
        item_images_binary_datas << Base64.strict_encode64(binary_data)
      end
    end
  end


  def show
    @product = Product.find(params[:id])
  end



  def update
    @product.update(product_params) if @product.user_id == current_user.id

    if @product.save
      redirect_to controller: :products, action: :show
      flash[:success] = "編集しました"
    else 
      redirect_to controller: :products, action: :edit
    end

    # itemにもともと登録されている画像のid
    ids = @item.images.map(&:id)
    # 上記のうち編集後も残っている画像のid
    exist_ids = registered_image_params[:ids].map(&:to_i)
    exist_ids.clear if exist_ids[0] == 0

    if @item.update(item_params) && (exist_ids.length != 0 || image_params[:images][0] != " ")
      unless ids.length == exist_ids.length
        delete_ids = ids - exist_ids
        delete_ids.each do |id|
          @item.images.find(id).destroy
        end
      end

      unless image_params[:images][0] == " "
        image_params[:images].each do |image|
          @item.images.create(image: image, item_id: @item.id)
        end
      end
      flash[:success] = "編集しました"
    else
      render 'items/edit'
    end
  end



private

  def product_params
    params.require(:product).permit(:name, :detail, :category, :price, :status, :state, :city, :delivery, :delivery_time, :fee_payer, images_attributes: [:image]).merge(user_id: current_user.id)
  end
  
  def image_params
    params.require(:images).permit({images: []})
  end


  def set_products_instance
    @product = Product.new
  end

  def set_products
    @product = Product.find(params[:id])
  end

end
