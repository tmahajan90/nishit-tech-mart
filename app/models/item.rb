class Item < ApplicationRecord
  belongs_to :vehicle_type
  has_many :vehicle_details
  has_many :orders
  has_many :clients, through: :orders

  validates :vehicle_type_id, presence: true
  validates :received_on, presence: true
  validates :quantity, presence: true
end
