Template.index.onRendered ->
  jQuery ($) ->
    $ ->
      $("#main-slider.carousel").carousel
        interval: 10000
        pause: false

    #Ajax contact
    form = $(".contact-form")
    form.submit ->
      $this = $(this)
      $.post $(this).attr("action"), ((data) ->
        $this.prev().text(data.message).fadeIn().delay(3000).fadeOut()
      ), "json"
      false

    #smooth scroll
    $(".navbar-nav > li").click (event) ->
      event.preventDefault()
      target = $(this).find(">a").prop("hash")
      $("html, body").animate
        scrollTop: $(target).offset().top
      , 500

    #scrollspy
    $("[data-spy=\"scroll\"]").each ->
      $spy = $(this).scrollspy("refresh")

    #PrettyPhoto
    $("a.preview").prettyPhoto social_tools: false

    #Isotope
    $(window).load ->
      $portfolio = $(".portfolio-items")
      $portfolio.isotope
        itemSelector: "li"
        layoutMode: "fitRows"

      $portfolio_selectors = $(".portfolio-filter >li>a")
      $portfolio_selectors.on "click", ->
        $portfolio_selectors.removeClass "active"
        $(this).addClass "active"
        selector = $(this).attr("data-filter")
        $portfolio.isotope filter: selector
        false



