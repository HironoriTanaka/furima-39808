require 'rails_helper'

RSpec.describe ItempurchasePurchase, type: :model do
  describe '購入内容の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @itempurchase_purchase = FactoryBot.build(:itempurchase_purchase, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'トークン・郵便番号・都道府県・市区町村・番地・電話番号が存在すれば登録できる' do
        expect(@itempurchase_purchase).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @itempurchase_purchase.building_name = ''
        expect(@itempurchase_purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @itempurchase_purchase.postal_code = ''
        @itempurchase_purchase.valid?
        expect(@itempurchase_purchase.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @itempurchase_purchase.postal_code = '0000-000'
        @itempurchase_purchase.valid?
        expect(@itempurchase_purchase.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @itempurchase_purchase.prefecture_id = 1
        @itempurchase_purchase.valid?
        expect(@itempurchase_purchase.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'cityが空だと保存できないこと' do
        @itempurchase_purchase.city = ''
        @itempurchase_purchase.valid?
        expect(@itempurchase_purchase.errors.full_messages).to include "City can't be blank"
      end

      it 'blockが空だと保存できないこと' do
        @itempurchase_purchase.block = ''
        @itempurchase_purchase.valid?
        expect(@itempurchase_purchase.errors.full_messages).to include "Block can't be blank"
      end

      it 'telが空だと保存できないこと' do
        @itempurchase_purchase.tel = ''
        @itempurchase_purchase.valid?
        expect(@itempurchase_purchase.errors.full_messages).to include "Tel can't be blank"
      end

      it 'tokenが空だと保存できないこと' do
        @itempurchase_purchase.token = ''
        @itempurchase_purchase.valid?
        expect(@itempurchase_purchase.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end