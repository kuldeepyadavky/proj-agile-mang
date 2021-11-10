class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :due_date
      t.date :end_date
      t.date :start_date
      t.decimal :story_point
      t.string :status
      t.string :task_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
