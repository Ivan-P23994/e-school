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

  action_item only: :index do
    link_to 'Export XLS', action: 'export_xlsx'
  end

  collection_action :export_xlsx, method: :get do
    @employees = Employee.all
    respond_to do |format|
      format.xlsx
    end
  end

  # XLSX IMPORT #

  action_item only: :index do
    link_to 'Import XLSX', action: 'open_xls_picker'
  end

  collection_action :open_xls_picker do
    render 'admin/xls/upload_xls'
  end

  collection_action :import_xls, method: :post do
    XlsHelper.convert_to_employees(params[:dump][:file])
    redirect_to({ action: :index }, notice: 'XLSX imported successfully!')

  rescue StandardError
    redirect_to({ action: :index },
                flash: { error: 'XLSX imported failed! Check the template is correct or contact a developer.' })
  end

  # CSV IMPORT #

  action_item only: :index do 
    link_to 'Import CSV', action: 'open_csv_picker'
  end

  collection_action :open_csv_picker do
    render 'admin/csv/upload_csv'
  end

  collection_action :import_csv, method: :post do
    CsvHelper.convert_to_employees(params[:dump][:file])
    redirect_to({ action: :index }, notice: 'CSV imported successfully!')

  rescue StandardError
    redirect_to({ action: :index },
                flash: { error: 'CSV imported failed! Check the template is correct or contact a developer.' })
  end
end
