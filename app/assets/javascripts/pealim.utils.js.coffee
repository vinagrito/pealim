(($)->
  window.Pealim ||= {}

  window.Pealim.Utils =
    spinnerOptions:
      lines: 9 # The number of lines to draw
      length: 0 # The length of each line
      width: 10 # The line thickness
      radius: 15 # The radius of the inner circle
      corners: 1 # Corner roundness (0..1)
      rotate: 0 # The rotation offset
      direction: 1 # 1: clockwise, -1: counterclockwise
      color: "#000" # #rgb or #rrggbb
      speed: 1.5 # Rounds per second
      trail: 0 # Afterglow percentage
      shadow: true # Whether to render a shadow
      hwaccel: false # Whether to use hardware acceleration
      className: "spinner" # The CSS class to assign to the spinner
      zIndex: 2e9 # The z-index (defaults to 2000000000)
      top: "auto" # Top position relative to parent in px
      left: "auto" # Left position relative to parent in px

    pealimSpinner: (settings)->
      options = $.extend {}, window.Pealim.Utils.spinnerOptions, settings
      options.className = "#{window.Pealim.Utils.spinnerOptions.className} #{settings.className}"

      spinner = new Spinner(options).spin()

) jQuery