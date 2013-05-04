class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  before_filter :session_locale
  # after_filter :set_redirect_back

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

  # def set_redirect_back
  #   key = 0
  #   if session[:request_back].blank?
  #     session[:request_back] = Hash.new
  #     session[:request_back][0] = request.referrer
  #   else
  #     key = session[:request_back].keys.last
  #     return if request.referrer == session[:request_back][key]
  #     session[:request_back][key + 1] = request.referrer
  #   end
  # end

end
