class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
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
    

    def check
      @item = Item.find(params[:item_id])
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
