require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last・firstname_kanjiとカナ、birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test99'
        @user.password_confirmation = 'test998'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'lastname_kanjiが空では登録できない' do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
      end
      it 'firstname_kanjiが空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end
      it 'lastname_kanaが空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test8'
        @user.password_confirmation = 'test8'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordが半角英字のみの場合登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordに半角英数字以外が含まれている場合登録できない' do
        @user.password = '@@@@@@'
        @user.password_confirmation = '@@@@@@'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが半角数字のみの場合登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'lastname_kanjiが半角カタカナでは登録できない' do
        @user.lastname_kanji = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji に全角文字を使用してください")
      end
      it 'lastname_kanjiが半角アルファベットでは登録できない' do
        @user.lastname_kanji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji に全角文字を使用してください")
      end
      it 'lastname_kanjiが半角数字では登録できない' do
        @user.lastname_kanji = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji に全角文字を使用してください")
      end
      it 'lastname_kanjiが半角記号では登録できない' do
        @user.lastname_kanji = '@@@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji に全角文字を使用してください")
      end
      it 'firstname_kanjiが半角カタカナでは登録できない' do
        @user.firstname_kanji = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji に全角文字を使用してください")
      end
      it 'firstname_kanjiが半角アルファベットでは登録できない' do
        @user.firstname_kanji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji に全角文字を使用してください")
      end
      it 'firstname_kanjiが半角数字では登録できない' do
        @user.firstname_kanji = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji に全角文字を使用してください")
      end
      it 'firstname_kanjiが半角記号では登録できない' do
        @user.firstname_kanji = '@@@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji に全角文字を使用してください")
      end
      it 'lastname_kanaが半角カタカナでは登録できない' do
        @user.lastname_kana = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana に全角文字を使用してください")
      end
      it 'lastname_kanaが半角アルファベットでは登録できない' do
        @user.lastname_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana に全角文字を使用してください")
      end
      it 'lastname_kanaが半角数字では登録できない' do
        @user.lastname_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana に全角文字を使用してください")
      end
      it 'lastname_kanaが半角記号では登録できない' do
        @user.lastname_kana = '@@@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana に全角文字を使用してください")
      end
      it 'firstname_kanaが半角カタカナでは登録できない' do
        @user.firstname_kana = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana に全角文字を使用してください")
      end
      it 'firstname_kanaが半角アルファベットでは登録できない' do
        @user.firstname_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana に全角文字を使用してください")
      end
      it 'firstname_kanaが半角数字では登録できない' do
        @user.firstname_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana に全角文字を使用してください")
      end
      it 'firstname_kanaが半角記号では登録できない' do
        @user.firstname_kana = '@@@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana に全角文字を使用してください")
      end
    end
  end
end