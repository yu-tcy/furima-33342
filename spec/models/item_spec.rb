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
        it '商品の状態についての情報が必須であること'do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status is not a number")
        end
        it '配送料の負担についての情報が必須であること'do
          @item.postage_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage is not a number")
        end
        it '発送元の地域についての情報が必須であること'do
          @item.area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Area is not a number")
        end
        it '発送までの日数についての情報が必須であること'do
          @item.day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Day is not a number")
        end
        it '価格についての情報が必須であること' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '販売価格は半角数字のみ保存可能であること' do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
      end
    end
  end
end