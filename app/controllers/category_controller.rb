class CategoryController < ApplicationController

  def category
    @category = MainCategory.includes(sub_categories: :sub2_categories).where(id: params[:id])
  end


  def category2
    @category = SubCategory.includes(:sub2_categories).where(id: params[:id])
  end


  def category3
    @category = Sub2Category.where(id: params[:id])
  end


end
