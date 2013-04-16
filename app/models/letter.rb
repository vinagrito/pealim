class Letter < ActiveRecord::Base

  def self.set_root(params)
    [ find(params[:root_1]).name, find(params[:root_2]).name,find(params[:root_3]).name ]
  end
end
