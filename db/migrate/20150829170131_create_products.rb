class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_type
      t.string :category
      t.string :name
      t.text :description
      t.string :picture

      t.timestamps null: false
    end
  end
end
