class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string      :postal_code, null: false
      t.text        :prefecture_id, null: false
      t.integer     :city, null: false
      t.integer     :block, null: false
      t.integer     :building_name
      t.integer     :tel, null: false
      t.references  :item_purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
