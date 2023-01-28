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
require 'rails_helper'

RSpec.describe Invoice, type: :model do
  subject { build(:invoice) }

  it { should allow_value('Random title for Invoice category').for(:title) }
  it { should allow_value(99.99).for(:paid_amount) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:invoice_no) }
  it do
    should define_enum_for(:status)
      .with_values(%w[paid unpaid])
      .backed_by_column_of_type(:integer)
  end
end
