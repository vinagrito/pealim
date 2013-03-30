$ ->
  getCurrentLanguage = (currentLocale)->
    modelColumn = "english"
    switch currentLocale
      when "Español"
        modelColumn = "spanish"
      when "Русский"
        modelColumn = "russian"
    modelColumn

  setAutocompleteList = (verbList)->
    $("#verb_name").autocomplete
        source: verbList
        focus: (event, ui) ->
          $(@).val(ui.item.label)
          $("#verb_id").val(ui.item.value)
          event.preventDefault()
        select: (event, ui) ->
          event.preventDefault()

  locales = []
  $("#language-nav").find("li:not(:empty) a").map (index, element) ->
    locales.push $(element).text()

  currentLocale = "English"
  if $("#language-nav").length isnt 0
    ["Español", "English", "Русский"].map (locale) ->
      currentLocale = locale if locales.indexOf(locale) is -1

  $("#verb_name").on "click", ->
    $.ajax(
      url: "/verbs"
      dataType: 'json'
    ).done (verbs) ->
      verbsNameList = []
      modelColumn = getCurrentLanguage(currentLocale)

      verbs.map (verb) ->
        verbsNameList.push
          label: verb[modelColumn]
          value: verb.id
      setAutocompleteList(verbsNameList)