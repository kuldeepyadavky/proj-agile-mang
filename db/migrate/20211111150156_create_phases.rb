class CreatePhases < ActiveRecord::Migration[6.1]
  def change
    create_table :phases do |t|
      t.string :title,  limit: 255

      t.timestamps
    end
  end
end
