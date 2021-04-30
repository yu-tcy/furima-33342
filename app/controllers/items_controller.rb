class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :postage_id, :area_id, :day_id, :image, :price).merge(user_id: current_user.id)
  end
end
