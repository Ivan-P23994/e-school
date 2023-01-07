# frozen_string_literal: true

ActiveAdmin.register Course do
  actions :index, :edit, :update, :create, :destroy

  permit_params :title, :description, :field_of_study

  index do
    selectable_column
    id_column
    column :title
    column :description
    actions
  end

  filter :title
  filter :description

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :field_of_study
    end
    f.actions
  end
end
