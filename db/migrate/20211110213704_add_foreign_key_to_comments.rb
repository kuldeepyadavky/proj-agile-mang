class AddForeignKeyToComments < ActiveRecord::Migration[6.1]
  def change
    drop_table :comments
    create_table :comments do |t|
      t.string :body
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
