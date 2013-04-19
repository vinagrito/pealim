class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  before_filter :session_locale

  def set_session_locale
    session[:locale] = params[:locale]
    redirect_to request.referer
  end

  def set_search_instance
    @search = VerbSearch.new
  end

  def get_values_for_new_verb
    @letters = Letter.where("num_value <= ? ", 400) # We don't query for ending letters
    @buildings = *Building.first#Building.get_allowed_building_types
    @new_heb_verb = HebrewVerb.new
  end

end
