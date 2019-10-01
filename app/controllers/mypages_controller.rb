class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def profile
  end

  def identification 
    @address= Address.find_by(user_id: current_user.id)  
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