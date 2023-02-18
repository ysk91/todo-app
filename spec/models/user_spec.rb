require 'rails_helper'

RSpec.describe 'Userモデルのテスト' do
  let(:user) {FactoryBot.create(:user)}

  describe 'バリデーションのテスト' do
    subject {test_user.valid?}
    let!(:test_user) {user}

    context '正しい投稿' do
      it '作成可能であること' do
        is_expected.to eq true;
      end
    end
    context 'nameカラム' do
      it '空欄を防ぐこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
      it '50文字以内であること' do
        test_user.name = 'a' * 51
        is_expected.to eq false;
      end
    end
    context 'emailカラム' do
      it '空欄を防ぐこと' do
        test_user.email = ''
        is_expected.to eq false;
      end
      it '形式が正しくあること' do
        test_user.email = 'false.com'
        is_expected.to eq false;
      end
      it 'ユニークであること' do
        duplicate_user = User.new(
          name: 'duplicate_user',
          email: test_user.email,
          password: 'password'
        )
        expect(duplicate_user.valid?).to eq false;
      end
    end
    context 'passwordカラム' do
      it '空欄を防ぐこと' do
        test_user.password = ''
        is_expected.to eq false;
      end
      it '6文字以上であること' do
        test_user.password = 'a' * 5
        is_expected.to eq false;
      end
      it '20文字以内であること' do
        test_user.password = 'a' * 21
        is_expected.to eq false;
      end
    end

  end
end