class Ticket < ApplicationRecord
  belongs_to :event
  enum ttype: [:free, :paid]
end
