class Ticket < ApplicationRecord
  belongs_to :event
  has_many :orders
  enum ttype: [:free, :paid]
end
