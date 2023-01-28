# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mark, type: :model do
  subject { build(:mark) }

  it { should allow_value('Random comment for mark category').for(:comment) }
  it { is_expected.to validate_presence_of(:mark) }
  it do
    should define_enum_for(:grade_point)
      .with_values(%w[A A- B+ B C+ C F])
      .backed_by_column_of_type(:integer)
  end
end
