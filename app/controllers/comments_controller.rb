class CommentsController < ApplicationController
  before_action :set_instance
  def create
    Comment.create(comment_params)
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to "/products/#{@product.id}"
  end

  private
  def comment_params
    params.required(:comment).permit(:text).merge(user_id: current_user.id,product_id: params[:product_id])
  end

  def set_instance
    @product = Product.find(params[:product_id])
  end
end
