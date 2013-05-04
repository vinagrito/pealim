class RenameConfirmedToReviewed < ActiveRecord::Migration
  def change
    rename_column :verbs, :confirmed, :reviewed
  end
end