json.extract! education, :id, :level, :course, :university, :passed_year, :gpa, :anticipated_passed_year, :created_at, :updated_at
json.url education_url(education, format: :json)
