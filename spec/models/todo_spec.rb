require 'rails_helper'

RSpec.describe 'Todoモデルのテスト' do
  let(:category) {FactoryBot.create(:category)}
  let!(:todo) {build(:todo, category_id: category.id)}

  describe 'バリデーションのテスト' do
    subject {test_todo.valid?}
    let!(:test_todo) {todo}

    context '正しい投稿' do
      it '作成可能であること' do
        is_expected.to eq true;
      end
    end
    context 'contentカラム' do
      it '空欄を防ぐこと' do
        test_todo.content = ''
        is_expected.to eq false;
      end
      it '100文字以内であること' do
        test_todo.content = 'a' * 101
        is_expected.to eq false;
      end
    end
  end

  describe 'statusのテスト' do
    it 'デフォルトがwaitingであること' do
      expect(todo.status == 'waiting').to eq true
    end
  end
end
