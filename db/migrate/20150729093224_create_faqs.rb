class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :category
      t.text :question
      t.text :answer
      t.integer :views

      t.timestamps null: false
    end
  end
end
