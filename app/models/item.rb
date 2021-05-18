class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price, inclusion: { in: 300..9999999, message: "Out of setting range", format: { with: /\A[0-9]+\z/ }}
    validates :text
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :area_id
    validates :day_id
  end

  belongs_to :user
  has_one_attached :image
  has_one :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :area
  belongs_to :day

end
