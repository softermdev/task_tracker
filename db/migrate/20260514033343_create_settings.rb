class CreateSettings < ActiveRecord::Migration[8.1]
  def change
    create_table :settings do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :theme, default: 'light'
      t.string :language, default: 'en'
      t.boolean :notifications_enabled, default: true
      t.boolean :email_notifications, default: true

      t.timestamps
    end
  end
end
