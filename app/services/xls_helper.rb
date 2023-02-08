# frozen_string_literal: true

# TODO: Make resource universal Helper

class XlsHelper
  class << self
    def convert_to_employees(file)
      employees = []
      xlsx = Roo::Spreadsheet.open(file.path)

      xlsx.to_a.drop(1).each do |employee|
        next if Employee.find_by(email: employee[2]).present?

        first_name, last_name, email, position = *employee
        employees << Employee.new(first_name:, last_name:, email:, position:)
      end
      save_employees(employees)
    end

    def save_employees(employees)
      Employee.transaction do
        employees.each(&:save!)
      end
    end
  end
end
