class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :field_of_study

      t.timestamps
    end
  end
end
