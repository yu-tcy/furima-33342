require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品登録' do

      context '登録できる時' do
        it '必要項目が存在していれば保存できること' do
          expect(@item).to be_valid
        end
      end

      context '登録できない時' do
        it '商品画像を1枚つけることが必須であること' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が必須であること' do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が必須であること' do
          @item.text = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
        it 'カテゴリーの情報が必須であること' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end
        it 'category_idが1の時は歩人できない事' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it '商品の状態についての情報が必須であること'do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status is not a number")
        end
        it 'status_idが1の時は歩人できない事' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end
        it '配送料の負担についての情報が必須であること'do
          @item.postage_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage is not a number")
        end
        it 'postage_idが1の時は歩人できない事' do
          @item.postage_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage must be other than 1")
        end
        it '発送元の地域についての情報が必須であること'do
          @item.area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Area is not a number")
        end
        it 'area_idが1の時は歩人できない事' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
        end
        it '発送までの日数についての情報が必須であること'do
          @item.day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Day is not a number")
        end
        it 'day_idが1の時は歩人できない事' do
          @item.day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Day must be other than 1")
        end
        it '価格についての情報が必須であること' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '商品価格が半角英数字混合では出品できない' do
          @item.price = "11aa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it '商品価格が半角英字のみでは出品できない' do
          @item.price = "aaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it '商品価格が全角文字では出品できない' do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it '商品価格が全角文字では出品できない' do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it '商品価格が全角文字では出品できない' do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it '商品価格が299円以下では出品できない' do
          @item.price = 29
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it '商品価格が10_000_000円以上では出品できない' do
          @item.price = 1000000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it 'userが紐付いていないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
  end
end