class AddConfirmationToVerb < ActiveRecord::Migration
  def change
    add_column :verbs, :confirmed, :boolean
  end
end
