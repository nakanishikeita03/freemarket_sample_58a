require 'rails_helper'

feature '編集・削除機能', type: :feature do
  let(:user) {create(:user)}
  let(:product) {create(:product,user: user)}
  let(:image) {create(:image)}

  scenario '未ログイン時は編集・削除がない' do
      # 未ログイン時には編集・削除ボタンがない
      visit product_path(product)
      expect(page).to have_no_content('商品の編集')
      expect(page).to have_no_content('この商品を削除する')
      
      #ログイン
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input[name="commit"]').click

      # ログイン後商品詳細ページに行くと編集・削除ボタンがある
      visit product_path(product)
      expect(page).to have_content('商品の編集')
      expect(page).to have_content('この商品を削除する')
    end
  end 