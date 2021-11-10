require 'rails_helper'

RSpec.describe 'User', type: :system do
  let(:user){FactoryBot.create(:user)}
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_registration_path # 新規登録画面へ遷移
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
    
    # ajaxのテスト
    # describe '編集のテスト' do
    # #   context '編集画面へ遷移' do
    # #     it '遷移ができる' do
    # #       visit edit_user_path(user)
    # #       expect(current_path).to eq edit_user_path(user)
    # #     end
    # #   end

    #   context '表示の確認と編集' do
    #     before do
    #       visit edit_user_path(user)
    #     end
    #     it '登録情報編集と表示される' do
    #       expect(page).to have_content('登録情報編集')
    #     end
    #     it '画像編集フォームが表示される' do
    #       expect(page).to have_field 'user[profile_image]'
    #     end
    #     it '名前編集フォームに自分の姓が表示される' do
    #       expect(page).to have_field '名前(姓)', with: user.last_name
    #     end
    #     it '名前編集フォームに自分の名が表示される' do
    #       expect(page).to have_field '名前(名)', with: user.first_name
    #     end
    #     it '名前編集フォームに自分のカナ姓が表示される' do
    #       expect(page).to have_field 'フリガナ(セイ)', with: user.kana_last_name
    #     end
    #     it '名前編集フォームに自分のカナ名が表示される' do
    #       expect(page).to have_field 'フリガナ(メイ)', with: user.kana_first_name
    #     end
    #     it 'メールアドレス編集フォームに自分のメールアドレスが表示される' do
    #       expect(page).to have_field 'メールアドレス', with: user.email
    #     end
    #     it '郵便番号編集フォームに自分の郵便番号が表示される' do
    #       expect(page).to have_field '郵便番号(ハイフンなし)', with: user.postal_code
    #     end
    #     it '住所編集フォームに自分の住所が表示される' do
    #       expect(page).to have_field '住所', with: user.address
    #     end
    #     it '電話番号編集フォームに自分の電話番号が表示される' do
    #       expect(page).to have_field '電話番号(ハイフンなし)', with: user.phone_number
    #     end
    #     it '自己紹介文編集フォームに自分の自己紹介文が表示される' do
    #       expect(page).to have_field '自己紹介文', with: user.introduction
    #     end
    #     it '編集に成功する' do
    #       # 名前を三郎に変更
    #       fill_in '名前(名)', with: '三郎'
    #       fill_in 'フリガナ(メイ)', with: 'サブロウ'
    #       click_button '変更を保存する'
    #       expect(page).to have_content '会員情報の更新が完了しました。'
    #       expect(page).to have_content 'テスト 三郎 (テスト サブロウ)'
    #       expect(current_path).to eq user_path(user)
    #     end
    #     it '編集に失敗する' do
    #       # first_name 名前(名)を空欄で入力
    #       fill_in '名前(名)', with: ''
    #       click_button '変更を保存する'
    #       expect(page).to have_content '件のエラーが発生したため 個人会員 は保存されませんでした。'
    #       expect(page).to have_content '名前(名)を入力してください'
    #       expect(current_path).to eq user_path(user)
    #     end
    #   end
    # end
  end

end