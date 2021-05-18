class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal,:city,:address,:apart,:number, :area_id, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く


  with_options presence: true do
    validates :token
    validates :postal,      format: {with:/\A\d{3}[-]\d{4}\z/,  message: "is invalid. Please input full-width characters."}
    validates :city
    validates :address
    validates :number, format: {with:/\A\d{10,11}\z/, message: "is invalid"}
    validates :user_id
    validates :item_id
  end
  
  with_options numericality: { other_than: 1 } do
    validates :area_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    @order_address = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, area_id: area_id, city: city, area_id: area_id, address: address, apart: apart, number: number, order_id: @order_address.id)
  end
end