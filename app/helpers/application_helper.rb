module ApplicationHelper

  def get_main_logo
    url("pealim-logo.png")
  end

  def get_locale_name(locale)
    name = "english"
    if locale == :es
      name = "spanish"
    elsif locale == :ru
      name = "russian"
    end
    name
  end
end
