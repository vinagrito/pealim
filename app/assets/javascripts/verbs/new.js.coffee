$ ->
  verbBuilding       = $("#hebrew_verb_building_id")
  fourthRootUi       = $(".verb-fourth-root")
  deleteFourthRoot   = $(".small-top-btn-delete")
  fourthRootPresence = $("#hidden_root_4")

  setFourthRootVisibility = (verbBuildingText) ->
    if verbBuildingText is "פִיעֵל"
      fourthRootUi.fadeIn()
    else
      fourthRootUi.fadeOut()

  verbBuilding.on "change", ->
    selectedOption = "option[value='#{$(@).val()}']"
    selectedOptionText = $(@).find(selectedOption).text()
    setFourthRootVisibility(selectedOptionText)

  deleteFourthRoot.on "click", ->
    fourthRootUi.hide()
    fourthRootPresence.val("delete")

  $(".submit.btn-success").on "click", ->
    if $(".verb-fourth-root").is(":visible")
      fourthRootPresence.val("")