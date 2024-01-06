class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :preparation

  validates :category, numericality: { other_than: 1, message: "can't be blank"} 
  validates :status, numericality: { other_than: 1, message: "can't be blank"} 
  validates :postage, numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank"} 
  validates :preparation, numericality: { other_than: 1, message: "can't be blank"} 
end
