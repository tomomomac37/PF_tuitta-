require 'rails_helper'

RSpec.describe 'User', type: :system do
  let(:user){FactoryBot.create(:user)}
  describe '投稿のテスト' do
    describe '新規投稿' do
      before do
        visit root_path # 新規登録画面へ遷移
      end
      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          # fill_in で登録情報をテキストボックスへ入力
          fill_in 'user_name', with: "testuser1"
          fill_in 'user_email', with: "testuser1@example.com"
          fill_in 'user_password', with: "testuser1"
          fill_in 'user_password_confirmation', with: "testuser1"                                       
          click_button 'Sign up' # ボタンをクリック
          expect(current_path).to eq homes_thanks_path
        end

        it '新規登録に失敗する' do
          fill_in 'user_name', with: ""
          fill_in 'user_email', with: ""
          fill_in 'user_password', with: ""
          fill_in 'user_password_confirmation', with: ""                                       
          click_button 'Sign up' # ボタンをクリック
          expect(current_path).to eq new_user_registration_path
        end
      end
    end

    describe 'ユーザーログイン' do
      before do
        visit new_user_session_path
      end

      context 'ログイン画面に遷移' do
        it 'ログインに成功する' do
          fill_in "user_email", with: user.email
          fill_in 'user_password', with: user.password
          click_button 'Log in'
          expect(current_path).to eq user_path(user)
        end

        it 'ログインに失敗する' do
          fill_in 'user_email', with: ''
          fill_in 'user_password', with: ''
          click_button 'Log in'
          expect(current_path).to eq new_user_session_path
        end
      end
    end
  end

  describe 'ユーザーのテスト' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end

    describe 'MyPageのテスト' do
      it 'MyPageと表示される' do
        expect(page).to have_content('MyPage')
      end
      it 'MyPageに遷移しEdit Profileが表示される' do
        visit user_path(user)
        expect(page).to have_content('Edit Profile')
      end
    end
  end

end