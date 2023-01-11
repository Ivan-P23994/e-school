ActiveAdmin.register Mark do
  config.per_page = [10, 50, 100]
  permit_params :user_id, :course_id, :mark, :grade_point, :comment
  
  index title: 'Student Mark Manager' do
    column :user
    column :mark
    column :grade_point
    column :comment
    actions
  end

  filter :user_first_name_or_user_last_name_cont, label: 'Student', as: :text, input_html: { rows: 1 }
  filter :course
  filter :grade_point, collection: Mark.grade_points, as: :select
end