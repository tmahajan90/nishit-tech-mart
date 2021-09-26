class Order < ApplicationRecord
  belongs_to :vehicle_detail
  belongs_to :client

  has_one :bill_detail

  validates :vehicle_detail_id, presence: true
  validates :client_id, presence: true

 
  def self.today?
    Order.where(delivery_on: Date.today)
  end

  def self.active?
    # Order.where(status: true)
    Order.all
  end

  def self.inactive?
    # Order.where(status: false)
    Order.all
  end

  def self.expired?
    Order.where("expire_at < ?", Date.today).where(status: true)
  end

  def self.renew id
    @order = Order.where(id: id)
    # @order.update(expire_at: 7.days.from_now)
  end

  def self.disable id
    @order = Order.where(id: id)
    @order.update(status: false)
  end
end
