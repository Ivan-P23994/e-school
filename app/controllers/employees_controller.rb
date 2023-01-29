# frozen_string_literal: true

class EmployeesController < ApplicationController
  # frozen_string_literal: true

  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
  end

  def show; end

  def new
    @employee =Eemployee.new
  end

  def edit; end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      respond_to do |format|
        format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html do
          redirect_to employee_url(@employee), notice: 'Employee was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:id, :first_name, :last_name, :email, :position, :team_id)
  end
end
