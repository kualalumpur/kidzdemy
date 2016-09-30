class Order < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  enum ttype: [:unpaid, :paid]
end
