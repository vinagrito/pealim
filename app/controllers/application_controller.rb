class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  before_filter :session_locale
  # after_filter :set_redirect_back

  def set_session_locale
    session[:locale] = params[:locale]
    if session[:ugc_verb] && session[:ugc_verb][:on]
      url_for_redirect = verb_path(session[:ugc_verb][:id])
      session[:ugc_verb][:on] = false
    else
      url_for_redirect = request.referer
    end
    redirect_to url_for_redirect
  end

  private

  def set_search_instance
    @search = VerbSearch.new
  end

  def get_values_for_new_verb
    @letters = Letter.where("num_value <= ? ", 400) # We don't query for ending letters
    @buildings = *Building.first#Building.get_allowed_building_types
    @new_heb_verb = HebrewVerb.new
  end

  def remove_ugc_verb_if_not_confirmed
    return if request.xhr?
    if session[:ugc_verb] && session[:ugc_verb][:on]
      HebrewVerb.find_by_id(session[:ugc_verb][:id]).verb.destroy
      session.delete :ugc_verb
    end
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
