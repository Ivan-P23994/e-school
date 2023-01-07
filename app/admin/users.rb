# frozen_string_literal: true

ActiveAdmin.register User, as: 'Student' do

  controller do
    def scoped_collection
      end_of_association_chain.where(role: 'student')
    end
  end
  actions :index, :view, :edit, :update, :create, :destroy

  permit_params :first_name, :email, :last_name, :lectured_course_id, :role

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :role
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :role
end

ActiveAdmin.register User, as: 'Lecturer' do

  controller do
    def scoped_collection
      end_of_association_chain.where(role: 'lecturer')
    end
  end
  actions :index, :view, :edit, :update, :create, :destroy

  permit_params :first_name, :email, :last_name, :lectured_course_id, :role

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :role
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :role
end
