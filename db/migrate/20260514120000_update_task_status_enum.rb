class UpdateTaskStatusEnum < ActiveRecord::Migration[8.0]
  def up
    # SQLite doesn't have enum types, status is stored as string
    # No schema changes needed, just update model validation
    # This migration is a placeholder to track the change
  end

  def down
    # Revert review status back to in_progress if needed
    if Task.table_exists?
      Task.where(status: 'review').update_all(status: 'in_progress')
    end
  end
end
