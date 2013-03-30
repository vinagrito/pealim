$ ->
  locales = []
  $("#language-nav").find("li:not(:empty) a").map (index, element) ->
    locales.push $(element).text()

  window.currentLocale = "English"
  if $("#language-nav").length isnt 0
    ["Español", "English", "Русский"].map (locale) ->
      window.currentLocale = locale if locales.indexOf(locale) is -1

  $.ajax("/verbs").done (verbs) ->
    verbsNameList = []
    modelColumn = "english"

    switch window.currentLocale
      when "Español"
        modelColumn = "spanish"
      when "Русский"
        modelColumn = "russian"

    verbs.map (verb) ->
      verbsNameList.push
        label: verb[modelColumn]
        value: verb.id

    $("#verb_name").autocomplete
      source: verbsNameList
      focus: (event, ui) ->
        $(@).val(ui.item.label)
        $("#verb_id").val(ui.item.value)
        event.preventDefault()
      select: (event, ui) ->
        event.preventDefault()
