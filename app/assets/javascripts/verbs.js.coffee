$ ->
  if $(".verb-show-action").length isnt 0
    window.Pealim.GoogleAnalyticsInstance ||= new window.Pealim.GoogleAnalytics()
    debugger
    verbMatch = $(".root-infinitive-translation h3").text().match(/(\S+)/g)
    if verbMatch
      [verbRoot, verbInfinitive, verbName] = [verbMatch[1][1...verbMatch[1].length-1], verbMatch[2], verbMatch[3].slice(1)]
    else 
      [verbRoot, verbInfinitive, verbName] = ["", "", "Not found"]

    window.Pealim.GoogleAnalyticsInstance.trackEvent("VerbSearch", "Show Conjugated verb", "#{verbRoot} - #{verbInfinitive} - #{verbName}")

  fourthRootUi       = $(".verb-fourth-root")
  fourthRootPresence = $("#hidden_root_4")

  setFourthRootVisibility = (verbBuildingText) ->
    if verbBuildingText is "פִיעֵל"
      fourthRootUi.fadeIn()
    else
      fourthRootUi.fadeOut()

  $(".selectpicker").selectpicker()
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

  if $.cookie("index visited") is null
    $("#help-link a").click()
    $.cookie("index visited", true)