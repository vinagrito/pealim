# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  posted_comm      = $('#list_of_comments')
  nameField        = $("#comment_author")
  emailField       = $("#comment_email")
  contentTextField = $("#comment_text")
  comment          = undefined

  addCommentBtn = $('#add-comment')

  afterSendNewComment = (newComment) ->
    $(posted_comm).prepend(newComment)
    $(nameField).val("")
    $(emailField).val("")
    $(contentTextField).val("")

    if $(".alert").length > 0
      setTimeout(
        ->
          $(".alert").slideUp(500)
          $("#add-comment").removeAttr('disabled')
        , 1500)
    else
      $("#add-comment").removeAttr('disabled')

  $(addCommentBtn).on 'click', ->
    addCommentBtn.attr("disabled",true)
    comment =
      "author": $(nameField).val()
      "email": $(emailField).val()
      "text": $(contentTextField).val()

    commentAjaxRequest(comment).done(afterSendNewComment)

  

  commentAjaxRequest = (comment)->
    $.ajax(
      url: "comments/new"
      data:
        comment: comment
      dataType: "html"
    )
