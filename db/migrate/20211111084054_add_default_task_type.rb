class AddDefaultTaskType < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :task_type, "Task"
  end
end
