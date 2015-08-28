class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :father
      t.string :mother
      t.integer :year_of_birth
      t.string :nation
      t.string :cv_url
      t.string :category
      t.text :description
      t.string :picture
      t.string :video

      t.timestamps null: false
    end
  end
end
