require 'rails_helper'

RSpec.describe 'Categoryモデルのテスト' do
  describe 'バリデーションのテスト' do
    let(:category) {FactoryBot.create(:category)}

    describe '正しい値' do
      it 'categoryが作成可能であること' do
        expect(category.valid?).to eq true;
      end
    end

    subject {test_category.valid?}
    let!(:test_category) {category}

    context 'titleカラム' do
      it '空欄を防ぐこと' do
        test_category.title = ''
        is_expected.to eq false;
      end

      it '50文字以内であること' do
        test_category.title = 'a' * 51
        is_expected.to eq false;
      end
    end
  end
end