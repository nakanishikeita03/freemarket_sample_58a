require 'rails_helper'
describe ProductsController do
  describe "GET #show" do
    it "responds successfully" do
      product = create(:product)
      get :show, params: {id: product}
      expect(response).to render_template :show  
    end
  end
end