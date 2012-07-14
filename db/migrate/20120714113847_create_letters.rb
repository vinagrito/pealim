class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :name
      t.text :comments
      t.timestamps
    end
  end
end
