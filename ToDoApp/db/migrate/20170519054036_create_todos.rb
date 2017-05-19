class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :task
      t.date :duedate
      t.boolean :completion_status

      t.timestamps
    end
  end
end
