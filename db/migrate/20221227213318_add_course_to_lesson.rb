# frozen_string_literal: true

class AddCourseToLesson < ActiveRecord::Migration[7.0]
  def up
    add_reference :lessons, :course, null: false, foreign_key: true, index: true
  end

  def down
    remove_reference :lessons, :course, null: false, foreign_key: true, index: true
  end
end
