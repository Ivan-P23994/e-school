# frozen_string_literal: true

ActiveAdmin.register Lesson do
  menu priority: 5

  permit_params :title, :description, :course_id

  index as: :grid do |lesson|
    div for: lesson do
      resource_selection_cell lesson
      h4  auto_link     lesson.title
      div simple_format lesson.description
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :description
    actions
  end

  filter :title
  # filter :by_isbn13_in, label: 'ISBN List', as: :text, input_html: {rows: 3}
  filter :description
end
