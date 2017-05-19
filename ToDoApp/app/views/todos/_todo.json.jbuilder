json.extract! todo, :id, :task, :duedate, :completion_status, :created_at, :updated_at
json.url todo_url(todo, format: :json)
