class HebrewVerb < ActiveRecord::Base

  belongs_to :verb, :foreign_key => 'verb_id'
  belongs_to :building, :foreign_key => 'building_id'
end
