class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:index, :new, :show]
  
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

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render 'items/edit', status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_title, :item_concept, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless @item && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
  
end
