# frozen_string_literal: true

ActiveAdmin.register Lesson do
  actions :index, :view, :edit, :update, :create, :destroy

  permit_params :title, :description

  index do
    selectable_column
    id_column
    column :title
    column :description
    actions
  end

  filter :title
  filter :description
end
