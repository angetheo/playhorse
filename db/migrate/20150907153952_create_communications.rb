class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.text :content
      t.string :comm_type

      t.timestamps null: false
    end
  end
end
