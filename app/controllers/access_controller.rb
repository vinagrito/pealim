class AccessController < ApplicationController

  def index
  end



  def set_user_lang
    I18n.locale = params[:locale]
    
    render 'index'# :controller => "access", :action => "index"
  end
end
