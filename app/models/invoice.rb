# == Schema Information
#
# Table name: invoices
#
#  id          :bigint           not null, primary key
#  invoice_no  :string           not null
#  user_id     :bigint           not null
#  title       :string
#  amount      :float            not null
#  paid_amount :float            not null
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Invoice < ApplicationRecord
  enum :status, [ :paid, :unpaid ], default: :unpaid

  belongs_to :user, inverse_of: :invoices
end
