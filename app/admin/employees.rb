# frozen_string_literal: true

ActiveAdmin.register Employee do
  config.per_page = [10, 50, 100]
  config.sort_order = 'id_asc'
  menu priority: 4

  permit_params :first_name, :email, :last_name, :team_id, :position

  index do
    column :first_name
    column :last_name
    column :email
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  
  collection_action :upload_csv do
    render 'admin/csv/upload_csv'
  end

  action_item only: :index do
    link_to 'Upload CSV', action: 'upload_csv'
  end

  collection_action :import_csv, method: :post do
    employees = CsvHelper.convert_to_employees(params[:dump][:file])
    Employee.transaction do
      employees.each(&:save!)
    end
    redirect_to({ action: :index }, notice: 'CSV imported successfully!')
  rescue StandardError
    redirect_to({ action: :index },
                flash: { error: 'CSV imported failed! Check the template is correct or contact a developer.' })
  end
end
