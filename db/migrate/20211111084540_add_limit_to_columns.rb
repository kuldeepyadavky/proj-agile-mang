class AddLimitToColumns < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :title, :string, :limit => 255
    change_column :projects, :description, :text, :limit => 500
    change_column :comments, :body, :text, :limit => 1000
  end
end
