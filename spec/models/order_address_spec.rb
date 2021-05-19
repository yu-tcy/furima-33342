require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.save
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    describe '商品購入' do
      context '購入できる時' do
        it '必要な情報を適切に入力すると、商品の購入ができること' do
          expect(@order_address).to be_valid
        end
        it '建物名が抜けていても登録できること' do
          @order_address.apart = ""
          expect(@order_address).to be_valid
        end
      end
      context '購入できない時' do
        it '郵便番号が必須である事' do
          @order_address.postal = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal is invalid. Please input full-width characters.")
        end
        it '都道府県が必須である事' do
          @order_address.area_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Area is not a number")
        end
        it 'area_idが1の時は保存できない事' do
          @order_address.area_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Area must be other than 1")
        end
        it '市区町村が必須である事' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it '番地が必須である事' do
          @order_address.address = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address can't be blank")
        end
        it '電話番号が必須である事' do
          @order_address.number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Number is invalid")
        end
        it '郵便番号にハイフンが必須である事' do
          @order_address.postal = "1234567"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal is invalid. Please input full-width characters.")
        end
        it '電話番号が11桁以内である事' do
          @order_address.number = "090123456789"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Number is invalid")
        end
        it 'phone_numberがハイフンがあると登録できない' do
          @order_address.number ="090-1234-5678"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Number is invalid")
        end
        it "tokenが空では登録できないこと" do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが存在しないと登録できない' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが存在しないと登録できない' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
        it '英数混合では登録できないこと' do
          @order_address.number ="090aaaa5678"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Number is invalid")
        end
      end
    end
  end
end
