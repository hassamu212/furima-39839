class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :item
  belongs_to :user
end
