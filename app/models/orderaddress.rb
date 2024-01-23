class Orderaddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :address, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }, allow_nil: true
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Deliveryaddress.create(address: address, prefecture_id: prefecture_id, municipalities: municipalities, 
      street_address: street_address, building_name: building_name, telephone_number: telephone_number, 
      order_id: order.id)
  end
end