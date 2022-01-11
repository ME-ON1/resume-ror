json.extract! project, :id, :name, :project_url, :description, :tech_stack, :created_at, :updated_at
json.url project_url(project, format: :json)
