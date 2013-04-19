module ApplicationHelper

  def locale_to_language(locale)
    name = "english"
    if locale == "es"
      name = "spanish"
    elsif locale == "ru"
      name = "russian"
    end
    name
  end

  def session_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def session_language
    locale_to_language(session_locale)
  end

end
