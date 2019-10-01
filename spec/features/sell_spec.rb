require 'rails_helper'

feature '出品ボタンを押下', type: :feature do
  let(:user) {create(:user)}
  let(:product) {create(:product)}
  
  scenario '未ログイン時はログインページに遷移、ログインすると出品画面に遷移' do
    # 未ログイン時に出品ボタンを押すとログインページに遷移
    visit root_path
    click_on('出品')
    expect(current_path).to eq new_user_session_path
    
    # emailとpasswordを入力しクリックすると出品ページに遷移
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq new_product_path
  end
end