class CategoryController < ApplicationController

  def category
    @categories = MainCategory.includes(sub_categories: :sub2_categories).find_by(id: params[:id])
    category_id = @categories.sub_categories.map(&:sub2_categories).flatten
    category_id.collect!{|category| category[:id]}
    @products = Product.includes(:images).where(category: category_id).order("created_at DESC").page(params[:page]).per(10)
  end


  def category2
    @categories = SubCategory.includes(:sub2_categories).find_by(id: params[:id])
    category_id = @categories.sub2_categories.map {|category| category["id"]}
    @products = Product.includes(:images).where(category: category_id).order("created_at DESC").page(params[:page]).per(100)
  end


  def category3
    @categories = Sub2Category.find_by(id: params[:id])
    @products = Product.includes(:images).where(category: @categories[:id]).order("created_at DESC").page(params[:page]).per(50)
  end


end
