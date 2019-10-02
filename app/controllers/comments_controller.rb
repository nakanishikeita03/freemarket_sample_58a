class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    Comment.create(comment_params)
    redirect_to "/products/#{@product.id}"
  end

  private
  def comment_params
    params.required(:comment).permit(:text).merge(user_id: current_user.id,product_id: params[:product_id])
  end
end
