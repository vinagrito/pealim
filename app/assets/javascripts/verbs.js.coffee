# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  locales = []
  $("#language-nav").find("li:not(:empty) a").map (index, element) ->
    locales.push $(element).text()

  currentLocale = "English"
  ["Español", "English", "Русский"].map (locale) ->
    currentLocale = locale  if locales.indexOf(locale) is -1


  commentDiv       = $('#comments')
  posted_comm      = $('#list_of_comments')
  nameField        = $("#comment_author")
  emailField       = $("#comment_email")
  contentTextField = $("#comment_text")

  addCommentBtn = $('#add-comment')

  afterSendNewComment = (newComment) ->
    $(posted_comm).prepend(newComment)
    $(nameField).val("")
    $(emailField).val("")
    $(contentTextField).val("")

    if $(".alert").length > 0
      $("#add-comment").attr 'disabled', true
      setTimeout(
        ->
          $(".alert").slideUp(500)
          $("#add-comment").removeAttr('disabled')
        , 1500)

  setFourthRootVisibility = (verbBuildingText) ->
    if verbBuildingText is "פִיעֵל"
      root_4.fadeIn()
    else
      root_4.fadeOut()

  $(addCommentBtn).on 'click', (e) ->
    e.preventDefault()

    commentObj =
      "author": $(nameField).val()
      "email": $(emailField).val()
      "text": $(contentTextField).val()

    $.ajax(
            url: "comments/new"
            data:
              comment: commentObj
            dataType: "html"
          ).done(afterSendNewComment)


  # CREATE VERB
  verbBuilding = $("#hebrew_verb_building_id")
  root_4       = $(".verb-fourth-root")
  deleteFourthRoot = $(".small-top-btn-delete")

  verbsNameList = []

  $.ajax("verbs/").done (verbs) ->
    modelColumn = "english"

    switch currentLocale
      when "Español"
        modelColumn = "spanish"
      when "Русский"
        modelColumn = "russian"

    # verbsNameList = verbs.map (verb) ->
    #   verb[modelColumn]
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


  verbBuilding.on "change", ->
    selectedOption = "option[value='#{$(this).val()}']"
    selectedOptionText = $(this).find(selectedOption).text()
    setFourthRootVisibility(selectedOptionText)

  deleteFourthRoot.on "click", ->
    root_4.hide()


  setFourthRootVisibility(verbBuilding.find("option[value='#{verbBuilding.val()}']").text())
