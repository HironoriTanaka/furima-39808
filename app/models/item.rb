class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :postage_type
  belongs_to :prefecture
  belongs_to :preparation_day, class_name: 'PreparationDay'

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :postage_type_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :preparation_day_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
