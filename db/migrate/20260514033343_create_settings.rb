class CreateSettings < ActiveRecord::Migration[8.1]
  def change
    create_table :settings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :theme, default: 'light'
      t.string :language, default: 'en'
      t.boolean :notifications_enabled, default: true
      t.boolean :email_notifications, default: true

      t.timestamps
    end
    
    add_index :settings, :user_id, unique: true
  end
end
