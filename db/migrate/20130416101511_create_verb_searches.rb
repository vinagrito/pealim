class CreateVerbSearches < ActiveRecord::Migration
  def change
    create_table :verb_searches do |t|
      t.integer :verb_id

      t.timestamps
    end
  end
end
