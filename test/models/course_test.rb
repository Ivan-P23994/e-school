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
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
