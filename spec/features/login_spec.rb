require 'rails_helper'

feature 'ログイン', type: :feature do
  let(:user) {create(:user)}
  let(:product) {create(:product,user: user)}
  let(:image) {create(:image)}

  scenario '未ログイン時はマイページがない' do
      # 未ログイン時はマイページがない
      visit root_path
      expect(page).to have_content('新規会員登録')
      expect(page).to have_content('ログイン')
      
      #ログイン
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input[name="commit"]').click

      # ログイン後トップページに行くとマイページがある
      visit root_path
      expect(page).to have_content('マイページ')
    end
  end 