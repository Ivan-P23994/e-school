# frozen_string_literal: true

class CreateUsersCoursesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :courses_users, id: false do |t|
      t.belongs_to :user, foreign_key: { to_table: :users }
      t.belongs_to :course, foreign_key: { to_table: :courses }
    end
  end
end
