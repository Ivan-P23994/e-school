json.extract! course, :id, :title, :description, :field_of_study, :created_at, :updated_at
json.url course_url(course, format: :json)
