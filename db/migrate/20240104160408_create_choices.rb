class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.integer    :category_id     , null: false
      t.integer    :status_id     , null: false
      t.integer    :postage_type_id     , null: false
      t.integer    :prefecture_id     , null: false
      t.integer    :preparation_day_id     , null: false
      t.timestamps
    end
  end
end
