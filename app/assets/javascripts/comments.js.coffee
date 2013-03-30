# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
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
