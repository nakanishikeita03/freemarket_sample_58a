require 'rails_helper'

describe SearchesController, type: :controller  do
  let(:user) {create(:user)}

  describe 'GET #index' do
  it "商品一覧ページに遷移するか" do
    login_user user
    get :index
    expect(response).to render_template :index
  end
  it "インスタンス変数が期待したものになるか" do
    products = create_list(:product, 1)
    get :index
    expect(assigns(:products)).to eq products 
  end
end

end
