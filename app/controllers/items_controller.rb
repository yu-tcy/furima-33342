class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end



  private

    def item_params
      params.require(:item).permit(:name, :text, :category_id, :status_id, :postage_id, :area_id, :day_id, :image, :price).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def check
      if @item.user != current_user || @item.order.present?
        redirect_to root_path
      end
    end

end
