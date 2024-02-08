class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string      :postal_code, null: false
      t.integer     :prefecture_id, null: false
      t.string     :city, null: false
      t.string     :block, null: false
      t.string     :building_name
      t.string     :tel, null: false
      t.references  :item_purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
