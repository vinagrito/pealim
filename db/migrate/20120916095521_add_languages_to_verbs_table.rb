class AddLanguagesToVerbsTable < ActiveRecord::Migration
  
  def self.up
    rename_column :verbs, :name_eng, :english
    add_column :verbs, :russian, :string
    add_column :verbs, :spanish, :string
  end

  def self.down
    rename_column :verbs, :english, :name_eng
    remove_column :verbs, :russian
    remove_column :verbs, :spanish
  end


end
