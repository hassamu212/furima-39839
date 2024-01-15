class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
    @orderaddress = Orderaddress.new
  end

  def create
    @orderaddress = Orderaddress.new(order_params)
    if @orderaddress.valid?
      @orderaddress.save
      redirect_to root_path
    else
      @items = Item.all
      render :index , status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:orderaddress).permit(:address, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :item_id).merge(user_id: current_user.id)
  end

end
