class TodoItem < ApplicationRecord
  belongs_to :todo_list

      default_scope { order due_date: :asc}

end
