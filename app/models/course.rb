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
#
class Course < ApplicationRecord

  validates :title, presence: true, length: 5..50
  validates :description, presence: true
end
