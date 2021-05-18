class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:index, :create]
  before_action :check_item

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
    

    def check_user
      @item = Item.find(params[:item_id])
      if @item.user_id == current_user.id
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

    def check_item
      @item = Item.find(params[:item_id])
      if @item.order.present?
        redirect_to root_path
      end
    end

end
