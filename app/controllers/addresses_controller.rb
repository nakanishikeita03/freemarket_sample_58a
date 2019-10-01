class AddressesController < ApplicationController
  before_action :authenticate_user!
  def step3
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
    redirect_to controller: '/card', action: 'step4'
    else
    redirect_to({action: 'step3'}, notice: '住所情報を入れ直してください')
    end
    
  end

  def update
    @address= Address.find_by(user_id: current_user.id)
    if @address.update(address_params)
      redirect_to root_path
    else
      flash.now[:alert] = '更新できません'
      render 'edit'
    end
  end

    private
    def address_params
      params.require(:address).permit(:l_name_kanji, :f_name_kanji, :l_name_kana, :f_name_kana, :postal_code, :city, :prefecture, :street, :building).merge(user_id: current_user.id)
    end
end
