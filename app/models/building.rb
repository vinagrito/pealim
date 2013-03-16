class Building < ActiveRecord::Base

  has_many :hebrew_verbs

  def self.get_allowed_building_types
    # allowed_to_create = %w(פָעַל פִיעֵל הִפְעִיל הִתְפַעֵל הִתְפַעֵל)
    Building.where("id < ?", 5)
  end
end
