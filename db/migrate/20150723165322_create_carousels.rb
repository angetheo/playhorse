class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :image
      t.string :title
      t.string :subtitle
      t.string :button
      t.string :button_url

      t.timestamps null: false
    end
  end
end
