class CreateVerbs < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.string  :name_eng
      t.text    :comments
      
      t.timestamps
    end
  end
end
