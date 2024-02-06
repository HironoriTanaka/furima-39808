class ItempurchasePurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building_name, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :city
    validates :block
    validates :tel, length: { in: 10..11 }
    validates :token
    validates :user_id
    validates :item_id
  end

    VALID_PHONE_NUMBER_REGEX = /\A[\d]+\z/.freeze
    validates_format_of :tel, with: VALID_PHONE_NUMBER_REGEX, message: 'には数字のみ設定してください'

  def save
    itempurchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, tel: tel, item_purchase_id: itempurchase.id)
  end
end
