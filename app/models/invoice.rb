class Invoice < ApplicationRecord
  enum :status, [ :paid, :unpaid ], default: :unpaid

  belongs_to :user
end
