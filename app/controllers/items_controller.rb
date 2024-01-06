class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
     @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'items/new', status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  private
  def item_params
    params.require(:item).permit(:item_title, :item_concept, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end
  
end
