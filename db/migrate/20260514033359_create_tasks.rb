class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, default: 'todo', null: false
      t.string :priority, default: 'medium'
      t.date :due_date
      t.references :project, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :assignee, foreign_key: { to_table: :users }
      t.datetime :deleted_at

      t.timestamps
    end
    
    add_index :tasks, :deleted_at
    add_index :tasks, :status
  end
end
