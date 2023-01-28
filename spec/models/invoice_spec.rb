
require 'rails_helper'

RSpec.describe Invoice, type: :model do
  subject { build(:invoice) }

  it { should allow_value('Random title for Invoice category').for(:title) }
  it { should allow_value(99.99).for(:paid_amount) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:invoice_no) }
  it do 
  should define_enum_for(:status).
      with_values(%w[paid unpaid]).
      backed_by_column_of_type(:integer)
  end
end
