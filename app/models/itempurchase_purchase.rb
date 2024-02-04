class ItempurchasePurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building_name, :tel, :item_id, :user_id, :token

    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :city, presence: true
    validates :block, presence: true
    validates :tel, presence: true
    validates :token, presence: true

  def save
    itempurchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, tel: tel, item_purchase_id: itempurchase.id)
  end
end
