# frozen_string_literal: true

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
FactoryBot.define do
  factory :invoice do
    sequence(:id) { |n| n }
    title { 'Title' }
    invoice_no { '0001' }
    amount { 99.99 }
    paid_amount { 99.99 }
    traits_for_enum(:status, %w[paid unpaid])
  end
end
