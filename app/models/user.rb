class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    with_options format: { message: "不適正な文字が含まれています" } do
      validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
      validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
      validates :family_name_2, format: { with: /\A[ァ-ヶー－]+\z/ }
      validates :last_name_2, format: { with: /\A[ァ-ヶー－]+\z/ }
    end
    validates :nickname
    validates :birthday
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "英数字文字6以上"}
  end

  has_many :items
end
