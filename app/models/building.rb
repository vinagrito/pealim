class Building < ActiveRecord::Base

  has_many :hebrew_verbs

  def self.get_allowed_building_types
    Building.where("id < ?", 5)
  end
end
