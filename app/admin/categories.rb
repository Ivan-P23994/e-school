# frozen_string_literal: true

ActiveAdmin.register Category do
  config.per_page = [10, 50, 100]
  config.sort_order = 'id_asc'
  config.filters = false

  actions :all, except: [:show, :new]


  permit_params :category

  index title: 'Category' do
    column '#' do |category|
      category.id
    end
    column :category
    actions
  end
end