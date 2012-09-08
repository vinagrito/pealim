class VerbsController < ApplicationController
  
  def index
    @heb_verbs = HebrewVerb.all
  end

  def show
    @heb_verb = HebrewVerb.find(params[:id])
  end

  def new
    @letters = Letter.where("num_value < ? ", 400)
    @heb_verb = HebrewVerb.new(params[:building_id])
  end

  def create
  end

end
