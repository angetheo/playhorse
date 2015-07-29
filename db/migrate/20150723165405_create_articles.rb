class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :image
      t.integer :views

      t.timestamps null: false
    end
  end
end
