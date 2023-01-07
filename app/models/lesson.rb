# frozen_string_literal: true

# == Schema Information
#
# Table name: lessons
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint           not null
#
class Lesson < ApplicationRecord
  belongs_to :course, inverse_of: :lessons

  validates :title, presence: true, length: 5..50
  validates :description, presence: true
end
