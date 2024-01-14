class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def create
    @Orderaddress = Orderaddress.new
    @Orderaddress = Orderaddress.new(order_params)
    if @orderaddress.valid?
      @orderaddress.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:orderaddress).permit(:address, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :use_id, :item_id).merge(user_id: current_user.id)
  end

end
