require 'rails_helper'

RSpec.describe 'categoriesコントローラのテスト' do
  let(:category) {create(:category)}
  describe 'TOPページの表示' do
    before do
      get root_path
    end
    it 'リクエストが200 OKとなること' do
      expect(response.status).to eq 200
    end
    it 'タイトルが表示されていること' do
      expect(response.body).to include('Home#top')
    end
  end

  describe 'categories_pathの表示テスト' do
    before do
      get categories_path
    end
    it 'リクエストが200 OKとなること' do
      expect(response.status).to eq 200
    end
    it 'タイトルが表示されていること' do
      expect(response.body).to include('Categories_index')
    end
  end
end