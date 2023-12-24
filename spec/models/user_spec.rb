require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "登録できる" do
        expect(@user).to be_valid
      end
      it 'family_nameとfirst_nameがひらがなでも登録できる' do
        @user.family_name = 'にっぽん'
        @user.first_name = 'たろう'
        @user.valid?
      end
      it 'family_nameとfirst_nameがカタカナでも登録できる' do
        @user.family_name = 'ニッポン'
        @user.first_name = 'タロウ'
        @user.valid?
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.email = FactoryBot.build(:user)
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.family_name = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.family_name = 'nipponn'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'family_name_kanaが半角では登録できない' do
        @user.family_name_kana = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end