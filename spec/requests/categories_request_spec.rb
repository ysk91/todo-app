require 'rails_helper'

RSpec.describe 'categoriesコントローラのテスト' do
  let(:category) {FactoryBot.create(:category)}
  let(:user) {FactoryBot.create(:user)}

  describe 'ログイン前' do
    it 'categories_pathが表示されない' do
      get categories_path
      expect(response.status).to eq 302
    end
  end
  describe 'ログイン後' do
    before do
      sign_in(user)
    end
    it 'categories_pathが表示される' do
      get categories_path
      expect(response.status).to eq 200
    end
  end
end