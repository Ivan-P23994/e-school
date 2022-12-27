# frozen_string_literal: true

class AddCourseToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.belongs_to :lectured_course, foreign_key: { to_table: :courses }
    end
  end
end
