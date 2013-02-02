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

  setFourthRootPartVisibility = (verbBuildingText) ->
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
  root_4       = $("#hebrew_verb_root_4")

  productsNameList = []

  $.ajax("verbs/").done (verbs) ->
    modelColumn = "english"

    switch currentLocale
      when "Español"
        modelColumn = "spanish"
      when "Русский"
        modelColumn = "russian"

    verbsNameList = verbs.map (verb) ->
      verb[modelColumn]

    $("#verb_name").autocomplete
      source: verbsNameList

  $("#help-link").popover()
  # $('#help-link').on("click", (e)->
  #   e.preventDefault()
  #   ).tooltip(
  #     trigger: 'click'
  #   )

  # .popover(
  #   placement: "bottom"
  #   ).on "click", (e) ->
  #   e.preventDefault()

  setFourthRootPartVisibility(verbBuilding.find("option[value='" + verbBuilding.val() + "']").text())

  verbBuilding.on 'change', ->
    setFourthRootPartVisibility($(this).find("option[value='" + $(this).val() + "']").text())


