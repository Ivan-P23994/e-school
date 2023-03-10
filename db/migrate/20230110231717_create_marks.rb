# frozen_string_literal: true

class CreateMarks < ActiveRecord::Migration[7.0]
  def change
    create_table :marks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :comment
      t.integer :mark
      t.integer :grade_point

      t.timestamps
    end
  end
end
