$ ->
  setAutocompleteList = (verbList)->
    $("#verb_name").autocomplete
        source: verbList
        focus: (event, ui) ->
          $(@).val(ui.item.label)
          $("#verb_id").val(ui.item.value)
          event.preventDefault()
        select: (event, ui) ->
          event.preventDefault()

  $("#verb_name").on "click", ->
    $.ajax(
      url: "/verbs"
      dataType: 'json'
    ).done (verbs) ->
      verbsNameList = []
      modelColumn = $("#current_locale").attr("content")

      verbs.map (verb) ->
        verbsNameList.push
          label: verb[modelColumn]
          value: verb.id
      setAutocompleteList(verbsNameList)