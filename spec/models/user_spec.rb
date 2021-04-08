require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '必須項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが英数字混合で6文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'お名前・お名前カナが全角であれば登録できる'do
        @user.family_name = '海'
        @user.last_name = 'きなこ'
        @user.family_name_2 = 'ウミ'
        @user.last_name_2 = 'キナコ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'family_name_2が空では登録できない' do
        @user.family_name_2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 2 can't be blank")
      end
      it 'last_name_2が空では登録できない' do
        @user.last_name_2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 2 can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'family_name_2が半角では登録できない' do
        @user.family_name_2 = 'ｳﾐ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 2 不適正な文字が含まれています')
      end
      it 'last_name_2が半角では登録できな' do
        @user.last_name_2 = 'ｷﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 2 不適正な文字が含まれています')
      end
    end
  end
end
