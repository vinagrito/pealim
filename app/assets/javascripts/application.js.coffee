# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require jquery
#= require jquery_ujs
#= require jquery-1.9.0
#= require jquery-ui-1.10.0.custom
#= require bootstrap
#= require_tree .
($)->
  $.ajax("/verbs").done (verbs) ->
    verbsNameList = []
    modelColumn = "english"

    switch currentLocale
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