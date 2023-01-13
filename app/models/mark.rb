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
class Mark < ApplicationRecord
  include MarkParser
  enum :grade_point, %w[A A- B+ B C+ C F]

  belongs_to :user, inverse_of: :marks
  belongs_to :course, inverse_of: :marks

  validates :user_id, :course_id, :mark, :grade_point, presence: true
  validate :correct_grade?

  def correct_grade?
    return if MarkParser.parse(mark) == grade_point

    errors.add(:grade_point, 'The assigned grade does not correspond to the provided mark')
  end
end
