require 'rails_helper'

RSpec.describe 'usersコントローラのテスト' do
  let(:user) {FactoryBot.create(:user)}

  describe 'ログイン前' do
    it 'ユーザー登録画面にアクセスできる' do
      get new_user_path
      expect(response.status).to eq 200
    end
    it 'ログイン画面にアクセスできる' do
      get login_path
      expect(response.status).to eq 200
    end
  end
  describe 'ログイン後' do
    before do
      sign_in(user)
    end
    it 'ユーザー登録画面にアクセスできない' do
      get new_user_path
      expect(response.status).to eq 302
    end
    it 'ログイン画面にアクセスできない' do
      get login_path
      expect(response.status).to eq 302
    end
  end

end