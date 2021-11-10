json.extract! project_task, :id, :title, :description, :due_date, :end_date, :start_date, :story_point, :status, :task_type, :projects_id, :user_id, :created_at, :updated_at
json.url project_task_url(project_task, format: :json)
