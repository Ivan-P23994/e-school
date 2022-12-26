class AddCourseToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.belongs_to :course, foreign_key: true
    end
  end
end
