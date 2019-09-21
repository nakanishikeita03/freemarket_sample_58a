class CardController < ApplicationController

  require "payjp"


  def index
    card = Card.where(user_id: current_user.id)

    if card.exists?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
  end





  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end
  

  def step4
  end


  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      if params['payjp-token'].blank?
        redirect_to action: "step4"
      else
      customer = Payjp::Customer.create(card: params['payjp-token']) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card, token: params['payjp-token'])
      if @card.save
        redirect_to controller: '/signup', action: 'done'
      else
        redirect_to action: "step4"
      end
    end
  end



  def pay 
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount:  #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
    redirect_to action: 'done' #完了画面に移動
  end



  def delete #PayjpとCardデータベースを削除します
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

  
  def show #Cardのデータpayjpに送り情報を取り出します
       card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
