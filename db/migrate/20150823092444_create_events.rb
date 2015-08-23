class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :name
      t.string :program
      t.string :hours
      t.string :announcement
      t.string :result

      t.timestamps null: false
    end
  end
end
