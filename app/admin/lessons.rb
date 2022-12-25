ActiveAdmin.register Lesson do
  actions :index, :view, :edit, :update, :create, :destroy

  permit_params :title, :description

  index do
    column :title
    column :description
    actions
  end

  filter :title
  filter :description
end
