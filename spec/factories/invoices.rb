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