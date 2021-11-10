json.extract! project, :id, :title, :description, :status, :due_date, :user_id, :created_at, :updated_at
json.url project_url(project, format: :json)
