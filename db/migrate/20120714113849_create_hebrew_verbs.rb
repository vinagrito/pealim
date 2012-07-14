class CreateHebrewVerbs < ActiveRecord::Migration
  def change
    create_table :hebrew_verbs do |t|
      t.references :building
      t.references :verb

      t.string :root

      t.string :infinitive

      t.string :me_past
      t.string :you_mas_sing_past
      t.string :you_fem_sing_past
      t.string :we_past
      t.string :you_mas_plu_past
      t.string :you_fem_plu_past
      t.string :he_past
      t.string :she_past
      t.string :they_past

      t.string :mas_sing_pres
      t.string :fem_sing_pres
      t.string :mas_plu_pres
      t.string :fem_plu_pres

      t.string :me_fut
      t.string :you_mas_sing_she_fut
      t.string :he_fut
      t.string :we_fut
      t.string :you_fem_sing_fut
      t.string :you_plu_fut
      t.string :they_fut

      t.string :mas_imp
      t.string :fem_imp
      t.string :plural_imp      

      t.timestamps
    end
    add_index "hebrew_verbs", ["building_id", "verb_id"]
  end
end
