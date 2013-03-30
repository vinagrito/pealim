$ ->
  fourthRootUi       = $(".verb-fourth-root")
  fourthRootPresence = $("#hidden_root_4")

  setFourthRootVisibility = (verbBuildingText) ->
    if verbBuildingText is "פִיעֵל"
      fourthRootUi.fadeIn()
    else
      fourthRootUi.fadeOut()

  $("#hebrew_verb_building_id").on "change", ->
    selectedOption = "option[value='#{$(@).val()}']"
    selectedOptionText = $(@).find(selectedOption).text()
    setFourthRootVisibility(selectedOptionText)

  $(".small-top-btn-delete").on "click", ->
    fourthRootUi.hide()
    fourthRootPresence.val("delete")

  $(".submit.btn-success").on "click", ->
    if $(".verb-fourth-root").is(":visible")
      fourthRootPresence.val("")