class CsvHelper
  # TODO: Make resource universal CsvHelper
  class << self
    def convert_to_employees(csv_data)
      employees = []
      csv_file = csv_data.read
      CSV.parse(csv_file) do |row|
        first_name, last_name, email, position = row
        employees << Employee.new(first_name: first_name, last_name: last_name, email: email, position: position)
      end
      employees
    end
  end
end