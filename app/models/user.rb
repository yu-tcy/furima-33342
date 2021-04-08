class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "不適正な文字が含まれています" }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "不適正な文字が含まれています" }
    validates :family_name_2, format: { with: /\A[ァ-ヶー－]+\z/, message: "不適正な文字が含まれています" }
    validates :last_name_2, format: { with: /\A[ァ-ヶー－]+\z/, message: "不適正な文字が含まれています" }
    validates :birthday
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "英数字文字6以上"}

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # end
  end
end
