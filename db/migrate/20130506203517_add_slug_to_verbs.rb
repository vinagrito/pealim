class AddSlugToVerbs < ActiveRecord::Migration
  def change
    add_column :verbs, :slug, :string
    add_index :verbs, :slug
  end
end
