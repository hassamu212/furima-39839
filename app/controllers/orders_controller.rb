class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def create
    @Order = Order.create(order_params)
    Dliveryaddresses.create(deliveryaddresses_params)
    redirect_to root_path
  end

  private

  def order_params
    params.merge(user_id: current_user.id, item_id: @item_id)
  end

  def deliveryaddresses_params
    params.permit(:address, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(order_id: @order.id)
  end

end
