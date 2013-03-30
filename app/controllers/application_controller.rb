class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_user_lang
    I18n.locale = params[:locale]

    redirect_to request.referer
  end

end
