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
require 'rails_helper'

RSpec.describe Lesson, type: :model do
  subject { build(:lesson) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
end
