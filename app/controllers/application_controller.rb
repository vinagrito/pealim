class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_user_lang
    I18n.locale = params[:locale]
    
    redirect_to :controller => 'verbs', :action => 'index'
  end

end
