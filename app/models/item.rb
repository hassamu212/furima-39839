class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :deliverycharge
  belongs_to :prefecture
  belongs_to :deliveryday
  has_one_attached :image

  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :image
    validates :item_title
    validates :item_concept
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank"}
  end
  
  def sold_out?
    self.order.present?
  end


end
