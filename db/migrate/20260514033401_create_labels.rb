class CreateLabels < ActiveRecord::Migration[8.1]
  def change
    create_table :labels do |t|
      t.string :name, null: false
      t.string :color, default: '#3b82f6'
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
