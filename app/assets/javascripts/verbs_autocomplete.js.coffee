$ ->
  setAutocompleteList = (verbList)->
    $("#verb_name").autocomplete
        source: verbList
        focus: (event, ui) ->
          $(@).val(ui.item.label)
          $("#verb_search_verb_id").val(ui.item.value)
          event.preventDefault()
        select: (event, ui) ->
          event.preventDefault()

  fetchVerbs = ->
    $.ajax(
      url: "/verbs"
      dataType: 'json'
    )

  $("#verb_name").on "click", ->
    verbsRequest = fetchVerbs()
    $.Deferred (verbsRequestDeferred) ->
      verbsRequest.done (verbs) ->
        modelColumn = $("#current_locale").attr("content")
        verbsNameList = verbs.map (verb) ->
          label: verb[modelColumn]
          value: verb.id
          # verbsNameList.push
        verbsRequestDeferred.resolve(verbsNameList)
        setAutocompleteList(verbsNameList)

