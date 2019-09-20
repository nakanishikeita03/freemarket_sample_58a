class CardController < ApplicationController
  
  def step4

  end

  def create
    redirect_to controller: '/signup', action: 'done'
  end
  
end
