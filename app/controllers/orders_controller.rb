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
    item_id = params[:item_id]
    params.require(:orderaddress).permit(:address, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: item_id)
  end

end
