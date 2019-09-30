require 'rails_helper'

describe ProductsController, type: :controller  do
  let(:user) {create(:user)}

  describe 'GET #index' do
  it "商品一覧ページに遷移するか" do
    login_user user
    get :index
    expect(response).to render_template :index
  end
end

  describe "GET #show" do
    it "responds successfully" do
      product = create(:product)
      get :show, params: {id: product}
      expect(response).to render_template :show  
    end
  end

  describe 'GET #edit' do
  
  it "商品編集ページに遷移するか" do
    product = create(:product)
    get :edit, params: { id: product }
    expect(response).to render_template :edit
  end
end

end