# == Schema Information
#
# Table name: lessons
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Lesson < ApplicationRecord

  validates :title, presence: true, length: 5..50
  validates :description, presence: true
end
