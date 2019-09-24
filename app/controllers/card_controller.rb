class CardController < ApplicationController

  require "payjp"

  before_action :authenticate_user!
  before_action :card_exist, only: [:index,:pay,:delete,:show,:confirmation]


  def index
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end


  def new
    card = Card.where(user_id: current_user.id)
    if card.exists?
      redirect_to action: "show"
    else
      redirect_to action: "step4"
    end
  end
  

  def step4
  end


  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      if card_params['payjp-token'].blank?
        redirect_to action: "step4"
      else
      customer = Payjp::Customer.create(card: card_params['payjp-token']) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card, token: params['payjp-token'])
        if @card.save
          redirect_to controller: '/signup', action: 'done'
        else
          redirect_to action: "step4"
        end
    end
  end


  def pay 
      product = Product.find(card_params[:product_id])
      redirect_to "/products/#{product.id}" if product.status != 0  #ヘルパーが使用出来なかった為仮置。ルーティング調整したら変更する事
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount:  product.price,
      customer: card.customer_id,
      currency: 'jpy',
      )
      product[:status] = 1
      product.save
     redirect_to action: 'complete'
  end


  def delete 
       card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  
  def show 
    card_information
    
  end


  def confirmation
    @product = Product.find(params[:product_id])
    @adresses = Address.find(@product.user.id)

    card_information
  end


  def complete
    @product = Product.find(params[:product_id])
    @adresses = Address.find(@product.user.id)
  end



  private

  def card_exist
    @card = Card.where(user_id: current_user.id).first
    redirect_to action: "step4" if @card.blank?
  end



  def card_params
    params.permit('payjp-token',:product_id)
  end

  
  def card_information
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end


end
