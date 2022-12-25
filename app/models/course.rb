class Course < ApplicationRecord

  validates :title, presence: true, length: 5..50
  validates :description, presence: true
end
