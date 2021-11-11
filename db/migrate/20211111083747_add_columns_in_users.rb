class AddColumnsInUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_active, :boolean, default: true

    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
