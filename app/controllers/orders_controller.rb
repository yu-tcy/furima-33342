class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
    before_action :check, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
    def order_params
      params.require(:order_address).permit(:postal, :city, :address, :apart, :number, :area_id, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
    
    def set_item
      @item = Item.find(params[:item_id])
    end

    def check
      if @item.user_id == current_user.id || @item.order.present?
        redirect_to root_path
      end
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end
