require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '新規登録できる場合' do
      it 'image,name,description,category_id,status_id,postage_type_id,prefecture_id,preparation_day_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空では登録できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空では登録できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "postage_type_idが空では登録できない" do
        @item.postage_type_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage type can't be blank")
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "preparation_day_idが空では登録できない" do
        @item.preparation_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is invalid")
      end
      it 'priceが半角カタカナでは登録できない' do
        @item.price = 'ｱｱｱ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが全角カタカナでは登録できない' do
        @item.price = 'アアア'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角アルファベットでは登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが全角アルファベットでは登録できない' do
        @item.price = 'ＡＡＡ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角記号では登録できない' do
        @item.price = '@@@'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが全角記号では登録できない' do
        @item.price = '＠＠＠'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end