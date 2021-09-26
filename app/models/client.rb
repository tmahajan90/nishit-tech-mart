class Client < ApplicationRecord
  has_many :orders
  has_many :items, through: :orders

  validates :name, presence: true
  validates :email, presence: true
  validates :mobile_no, presence: true
  validates :address, presence: true
end
