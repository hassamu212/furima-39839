class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]
  before_action :set_item, only: [:show, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  
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
  end

  def edit
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render 'items/edit', status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item_title, :item_concept, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
