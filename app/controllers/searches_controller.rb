class SearchesController < ApplicationController
  def index
    # binding.pry
    @q = Product.ransack(params[:q])
    @products = Product.search(params[:search]).limit(132)
    @search = params[:search]
  end

  def detail_search
    @q = Product.ransack(params[:q])
    @search = params[:q][:name_cont]
    @search_product = Product.ransack(params[:q]) 
    @products = @search_product.result.page(params[:page])
  end

private
  def detail_search_params
    params.require(:q)
    .permit(:name_cont,
            :price_gteq, 
            :price_lteq, 
            :sorts,
            {state_in: []}, 
            {fee_payer_in: []}, 
            {status_in: []})
  end
end
