require 'rails_helper'

RSpec.describe 'Userシステムspec' do
  let(:user) {FactoryBot.create(:user)}

  describe 'ユーザー新規作成' do
    it '新規作成できる' do
      visit new_user_path
      expect(current_path).to eq(new_user_path)
      fill_in 'user_name', with: 'system_spec'
      fill_in 'user_email', with: 'foo@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(categories_path)
    end
    it '新規作成できない' do
      visit new_user_path
      expect(current_path).to eq(new_user_path)
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content('') # フラッシュメッセージ
      expect(page).to have_content('') # エラーメッセージ
    end
  end
  describe 'ログイン, ログアウト' do
    it 'ログインできる' do
      visit login_path
      expect(current_path).to eq(login_path)
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      expect{
        find('input[name="commit"]').click
      }.to # current_user.name == user.name
      expect(current_path).to eq(categories_path)
    end
    it 'ログインできない' do
      visit login_path
      expect(current_path).to eq(login_path)
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      expect{
        find('input[name="commit"]').click
      }.to # users_session.mil?
      expect(current_path).to eq(login_path)
      expect(page).to have_content('') # フラッシュメッセージ
      expect(page).to have_content('') # エラーメッセージ
    end
    it 'ログアウトできる' do
      before do
        sigin_in(user)
      end
      visit categories_path

    end
  end
end