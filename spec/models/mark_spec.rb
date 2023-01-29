# frozen_string_literal: true

# == Schema Information
#
# Table name: marks
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  course_id   :bigint           not null
#  comment     :string
#  mark        :integer
#  grade_point :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
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
