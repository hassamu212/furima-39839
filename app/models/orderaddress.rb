class Orderaddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number
  
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :address, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :municipalities, presence: true
  validates :street_address, presence: true        
  validates :telephone_number, presence: true, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }, allow_nil: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Deliveryaddress.create(address: address, prefecture_id: prefecture_id, municipalities: municipalities, 
      street_address: street_address, building_name: building_name, telephone_number: telephone_number, 
      building_name: building_name, order_id: order.id)
  end
end