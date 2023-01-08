class Invoice < ApplicationRecord
  enum :status, [ :paid, :unpaid ]

  belongs_to :user
end
