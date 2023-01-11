ActiveAdmin.register Mark do
  config.per_page = [10, 50, 100]
  permit_params :user_id, :mark, :grade_point, :comment
  
  index title: 'Student Mark Manager' do
    selectable_column
    column :user
    column :mark
    column :grade_point
    column :comment
  end

end
