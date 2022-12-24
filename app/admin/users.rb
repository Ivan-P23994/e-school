ActiveAdmin.register User do
  actions :index, :view, :edit, :update, :create, :destroy

  permit_params :first_name, :email, :last_name

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
