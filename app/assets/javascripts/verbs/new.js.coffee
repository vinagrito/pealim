$ ->
  verbBuilding     = $("#hebrew_verb_building_id")
  root_4           = $(".verb-fourth-root")
  deleteFourthRoot = $(".small-top-btn-delete")

  setFourthRootVisibility = (verbBuildingText) ->
    if verbBuildingText is "פִיעֵל"
      root_4.fadeIn()
    else
      root_4.fadeOut()

  verbBuilding.on "change", ->
    selectedOption = "option[value='#{$(@).val()}']"
    selectedOptionText = $(@).find(selectedOption).text()
    setFourthRootVisibility(selectedOptionText)

  deleteFourthRoot.on "click", ->
    root_4.hide()
    $("#hebrew_verb_hidden_root_4").val("delete")