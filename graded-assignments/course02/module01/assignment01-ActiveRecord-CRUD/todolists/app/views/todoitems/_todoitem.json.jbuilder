json.extract! todoitem, :id, :due_date, :title, :description, :completed, :created_at, :updated_at
json.url todoitem_url(todoitem, format: :json)
