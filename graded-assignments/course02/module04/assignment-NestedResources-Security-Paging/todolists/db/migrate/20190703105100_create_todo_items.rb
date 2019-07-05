class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.date :due_date
      t.string :title
      t.text :description
      t.boolean :completed
      t.references :todo_list, foreign_key: true

      t.timestamps
    end
  end
end
