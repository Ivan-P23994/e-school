# frozen_string_literal: true

ActiveAdmin.register Asset do
  config.per_page = [10, 50, 100]
  config.sort_order = 'id_asc'
  config.filters = false

  actions :all, except: [:show]

  permit_params :serial, :title, :status, :category_id, :location

  index title: 'Assets' do
    column '#' do |category|
      category.id
    end
    column :serial
    column :title
    column :status
    column "Category" do |asset|
      span asset.category.category
    end
    column :location
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.input :serial
    f.input :title
    f.input :status
    f.input :category, as: :select, collection: Category.all.collect {|product| [product.category, product.id] }
    f.input :location
    f.actions
  end
end
