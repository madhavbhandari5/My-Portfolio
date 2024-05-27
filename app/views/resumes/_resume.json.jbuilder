json.extract! resume, :id, :title, :file, :created_at, :updated_at
json.url resume_url(resume, format: :json)
json.file url_for(resume.file)
