class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         kanji = /\A[一-龥]+\z/
         kana = /\A([ァ-ン]|ー)+\z/
         year_month_day = /\A\d{4}-\d{2}-\d{2}\z/

  validates :nickname, presence: true, length: { maximum: 15 }
  validates :f_name_kanji, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :l_name_kanji, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :f_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :l_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :birthday, presence: true, format: { with: year_month_day }
end
