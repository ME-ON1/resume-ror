json.extract! company, :id, :name, :position, :description, :start, :end, :created_at, :updated_at
json.url company_url(company, format: :json)