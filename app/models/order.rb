class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  validates :order_no,        :presence => true
  validates :total_amount,    :presence => true
  
  default_scope :order => 'orders.updated_at DESC'
end
