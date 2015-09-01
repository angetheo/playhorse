class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :division
      t.string :role
      t.integer :order
      t.string :picture

      t.string :facebook
      t.string :mail
      t.string :phone
      t.string :linkedin

      t.timestamps null: false
    end
  end
end
