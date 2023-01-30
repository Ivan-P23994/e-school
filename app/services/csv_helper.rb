# frozen_string_literal: true

# TODO: Make resource universal Helper

class CsvHelper
  class << self
    def convert_to_employees(csv_data)
      employees = []
      csv_file = csv_data.read
      CSV.parse(csv_file) do |row|
        first_name, last_name, email, position = row
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
