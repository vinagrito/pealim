class AddPastBaseToHebrewVerb < ActiveRecord::Migration
  def change
    add_column :hebrew_verbs, :past_base, :string
  end
end
