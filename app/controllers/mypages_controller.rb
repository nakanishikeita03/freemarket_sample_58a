class MypagesController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def profile
  end

  def identification   
  end

  def card
    @card = Card.where(user_id: current_user.id).first
    if @card.present?
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
end