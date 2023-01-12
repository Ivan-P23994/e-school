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
  enum :grade_point, %w[A A- B+ B C+ C F]

  belongs_to :user, inverse_of: :marks
  belongs_to :course, inverse_of: :marks
end
