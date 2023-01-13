# frozen_string_literal: true

ActiveAdmin.register User, as: 'Student' do
  config.per_page = [10, 50, 100]
  config.sort_order = 'id_asc'
  menu priority: 4

  controller do
    def scoped_collection
      end_of_association_chain.where(role: 'student')
    end
  end

  actions :index, :view, :edit, :update, :create, :destroy

  permit_params :first_name, :email, :last_name, :lectured_course_id, :role

  index do
    column :first_name
    column :last_name
    column :email
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
end

ActiveAdmin.register User, as: 'Lecturer' do
  config.per_page = [10, 50, 100]
  config.sort_order = 'id_asc'
  menu priority: 3

  controller do
    def scoped_collection
      end_of_association_chain.where(role: 'lecturer')
    end
  end

  actions :index, :view, :edit, :update, :create, :destroy

  permit_params :first_name, :email, :last_name, :lectured_course_id, :role

  index do
    column :first_name
    column :last_name
    column :email
    column 'Lectured Course' do |lecturer|
      span lecturer.lectured_course.title
    end
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
end
