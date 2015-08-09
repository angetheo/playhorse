class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.text :title
      t.text :description
      t.string :icon

      t.timestamps null: false
    end
  end
end
