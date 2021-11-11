class Renamecolumn < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :comments, :projects
  # add_references :comments, :tasks

  end
end
