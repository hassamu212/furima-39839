class ItemsController < ApplicationController
  
  def index
    # @items = Item.all
  end

  def new
    before_action :authenticate_user!
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
  
  private
  def item_params
    params.require(:item).permit(:item_title, :item_concept, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end
  
end
