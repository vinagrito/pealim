class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string  :name
      t.integer :num_value
      t.text    :comments
      t.timestamps
    end
  end
end
