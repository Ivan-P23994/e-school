# frozen_string_literal: true

ActiveAdmin.register Category do
  config.per_page = [10, 50, 100]
  config.sort_order = 'id_asc'
  config.filters = false

  actions :all, except: [:show]

  permit_params :category

  index title: 'Asset Category' do
    column '#', &:id
    column :category
    actions
  end
end
