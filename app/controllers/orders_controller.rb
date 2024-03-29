class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :move_to_index, expect: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @orderaddress = Orderaddress.new
  end

  def create
    @orderaddress = Orderaddress.new(order_params)
    if @orderaddress.valid?
      pay_item
      @orderaddress.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index , status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:orderaddress).permit(:address, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if @item && current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.sold_out?
      redirect_to root_path
    end
  end

end
