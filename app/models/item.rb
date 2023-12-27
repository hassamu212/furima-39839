class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  
  validates :item_title, presence: true
  validates :item_concept, presence: true
  validates :price, presence: true
  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id, presence: true,numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
end
