class Letter < ActiveRecord::Base

  def self.create_root_from_letters(root_1, root_2, root_3)
    [ find(root_1).name, find(root_2).name, find(root_3).name ]
  end
end
