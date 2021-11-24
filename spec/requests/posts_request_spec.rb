require 'rails_helper'

RSpec.describe "postコントローラーのテスト", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  describe 'ログイン済み' do
    before do
      sign_in user
    end
    context "投稿一覧ページが正しく表示される" do
      before do
        get root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("Tweet")
      end
    end
  end
  describe '非ログイン' do
    context "投稿一覧ページへ遷移されない" do
      before do
        get root_path
      end
      it 'ログインページに戻る' do
        expect(response.status).to eq 302
      end
    end
  end
end