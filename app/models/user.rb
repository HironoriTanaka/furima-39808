class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :item_purchases
  has_many :items

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'に全角文字を使用してください' } do
    validates :lastname_kanji, presence: true
    validates :firstname_kanji, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'に全角文字を使用してください' } do
    validates :lastname_kana, presence: true
    validates :firstname_kana, presence: true
  end

  validates :birth, presence: true
end
