class AddCompletedToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :completed_at, :boolean, default: false
  end
end
