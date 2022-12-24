ActiveAdmin.register User do
  actions :index, :edit, :update, :create, :destroy

  permit_params :first_name, :email, :last_name
  
  index do
    column :first_name
    column :last_name
    column :email
    actions
  end

  filter :name
  filter :company

end
