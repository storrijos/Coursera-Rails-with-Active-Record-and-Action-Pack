class CreateTodolists < ActiveRecord::Migration[5.2]
  def change
    create_table :todolists do |t|
      t.string :list_name
      t.date :list_due_date

      t.timestamps
    end
  end
end
