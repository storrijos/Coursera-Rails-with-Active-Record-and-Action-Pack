class TodoItem < ApplicationRecord

    def self.count_of_completed_todo_items
        TodoItem.where(completed:true).count
    end

end
