require 'rails_helper'

RSpec.describe 'Userシステムspec' do
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
  end
  describe 'ユーザー作成できないときにnewページにリダイレクト、フラッシュメッセージを確認ん' do
    # 新規ユーザー作成画面にアクセス
    # フォーム入力
    # ユーザーが1増える
  end
  describe 'ログイン' do
    # 新規ユーザー作成画面にアクセス
    # フォーム入力
    # ユーザーが1増える
  end
  describe 'ログインできない' do
    # 新規ユーザー作成画面にアクセス
    # フォーム入力
    # ユーザーが1増える
  end
  describe 'ログアウト' do
    # 新規ユーザー作成画面にアクセス
    # フォーム入力
    # ユーザーが1増える
  end
end