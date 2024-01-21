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

  validates :image, presence: true
  validates :item_title, presence: true
  validates :item_concept, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  
  
  def sold_out?
    self.order.present?
  end


end
