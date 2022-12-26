# == Schema Information
#
# Table name: courses
#
#  id             :bigint           not null, primary key
#  title          :string
#  description    :text
#  field_of_study :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  lecturer_id    :bigint
#  students_id    :bigint
#
class Course < ApplicationRecord
  has_one :lecturer, class_name: 'User', inverse_of: :course

  validates :title, presence: true, length: 5..50
  validates :description, presence: true
end
