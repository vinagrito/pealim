class Letter < ActiveRecord::Base

  def self.create_root_from_letters(params)
    [ find(params[:root_1]).name, find(params[:root_2]).name,find(params[:root_3]).name ]
  end
end
