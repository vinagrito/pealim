$ ->
  class GoogleAnalytics
    constructor: ->
      window._gaq = window._gaq or []
      window._gaq.push ["_setAccount", "UA-42275920-1"]
      window._gaq.push ["_setDomainName", "pealim.com"]
      window._gaq.push ["_trackPageview"]
      (->
        ga = document.createElement("script")
        ga.type = "text/javascript"
        ga.async = true
        ga.src = ((if "https:" is document.location.protocol then "https://ssl" else "http://www")) + ".google-analytics.com/ga.js"
        s = document.getElementsByTagName("script")[0]
        s.parentNode.insertBefore ga, s
      )()

    trackEvent: (category, action, label) ->
      window._gaq.push ['_trackEvent', category, action, label]

  window.Pealim ||= {}
  window.Pealim.GoogleAnalytics = GoogleAnalytics