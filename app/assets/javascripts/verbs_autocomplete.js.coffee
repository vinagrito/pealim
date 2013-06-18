$ ->
  verbInputField = $("#verb_name")
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

  loadindVerbsAjaxState = ->
    $(".ajaxSpinner").children(":first").removeClass "hidden"
    $("#verb_name").attr "disabled", true

  verbsLoadedAjaxState = ->
    $(".ajaxSpinner").children(":first").addClass "hidden"
    $("#verb_name").removeAttr "disabled"

  verbInputField.on "click", ->
    loadindVerbsAjaxState()
    verbsRequest = fetchVerbs()
    $.Deferred (verbsRequestDeferred) ->
      verbsRequest.done (verbs) ->
        modelColumn = $("#current_locale").attr("content")
        verbsNameList = verbs.map (verb) ->
          label: verb[modelColumn]
          value: verb.id

        verbsRequestDeferred.resolve(verbsNameList)
        setAutocompleteList(verbsNameList)
        verbsLoadedAjaxState()

  $("#search-btn").click ->
    if verbInputField.val() is "" then return false
