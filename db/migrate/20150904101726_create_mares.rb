class CreateMares < ActiveRecord::Migration
  def change
    create_table :mares do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
