(function($) {
    "use strict";

    /* -------------------------------------------------------
     Portfolio filter set active class for style
    ----------------------------------------------------------*/
    $('.portfolio-filter li').on('click', function(event) {
        $(this).siblings('.active').removeClass('active');
        $(this).addClass('active');
        event.preventDefault();
    });

    /* --------------------------------------------------------
     Isotope | initialization Isotope
     --------------------------------------------------------- */
    var $varPortfolio = $(".portfolio:not(.portfolio-masonry)");
    if ($.fn.imagesLoaded && $varPortfolio.length > 0) {
        imagesLoaded($varPortfolio, function() {
            setTimeout(function() {
                $varPortfolio.isotope({
                    itemSelector: '.portfolio-item',
                    layoutMode: 'fitRows',
                    filter: '*'
                });
                $(window).trigger("resize");
            }, 500);

        });
    };


    /* ----------------------------------------------------
     Portfolio masonry style isotope
     ------------------------------------------------------*/
    var $varPortfolioMasonry = $('.portfolio-masonry');
    if (typeof imagesLoaded == 'function') {
        imagesLoaded($varPortfolioMasonry, function() {
            setTimeout(function() {
                $varPortfolioMasonry.isotope({
                    itemSelector: '.portfolio-item',
                    resizesContainer: false,
                    layoutMode: 'masonry',
                    filter: "*"
                });
            }, 500);

        });
    };

    /* ---------------------------------------------------
     Portfolio filtering
     ---------------------------------------------------- */
    $('.portfolio-filter').on('click', 'a', function() {
        $('#filters button').removeClass('current');
        $(this).addClass('current');
        var filterValue = $(this).attr('data-filter');
        $(this).parents(".portfolio-filter-wrap").next().isotope({
            filter: filterValue
        });
    });

    /* ---------------------------------------------------
     Portfolio filtering random
     ---------------------------------------------------- */
    $('.random-btn').on('click', function() {
        $varPortfolio.isotope('updateSortData').isotope({
            sortBy: 'random'
        });
    });

    /* -----------------------------------------------
     Venobox Activation
     -------------------------------------------------*/
    $('.venobox').venobox();

    /*------------------------------------------------
     Scroll Up activation
    -------------------------------------------------- */
    $.scrollUp({
        scrollText: '<i class="fa fa-angle-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'fade'
    });

    /*------------------------------------------------
     Fun Fact Counter Activation
    -------------------------------------------------- */
    $('.fun-fact-numb').counterUp({
        delay: 20,
        time: 2000
    });

    /*------------------------------------------------
      Top menu stick
     -------------------------------------------------- */
    var sticky_menu = $("#sticky-header-area");
    var pos = sticky_menu.position();
    if (sticky_menu.length) {
        var windowpos = sticky_menu.offset().top;
        $(window).on('scroll', function() {
            var windowpos = $(window).scrollTop();
            if (windowpos > pos.top) {
                sticky_menu.addClass("sticky");
            } else {
                sticky_menu.removeClass("sticky");
            }
        });
    }

    /*------------------------------------------------
     All owl carousel activation code goes here
    -------------------------------------------------- */

    //// Brand image carousel
    $(".client-logo-wrapper ").owlCarousel({
        autoPlay: false,
        items: 6,
        itemsDesktop: [1199, 6],
        itemsDesktopSmall: [979, 4],
        itemsTablet: [768, 3],
        itemsMobile: [479, 2],
        navigation: false,
        pagination: false
    });

    //// Hero Slider carousel
    $(".carousel-hero-slider-wrap, #blog-three-carousel").owlCarousel({
        autoPlay: false,
        pagination: false,
        singleItem: true,
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']
    });

    //// Post galley slider, Testimonial, Instragram widget active.
    $(".post-gallery-img, .testimonial-curosel-base, .instra-widget, .container-slider-wrapper").owlCarousel({
        autoPlay: false,
        pagination: true,
        singleItem: true,
        navigation: false
    });

    //// Related project carousel, Popular post full carousel
    $(".related-project-carousel, .popular-post-carousel-full, .member-list-wrapper").owlCarousel({
        autoPlay: false,
        pagination: false,
        items: 4,
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 2],
        itemsMobile: [570, 1],
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']
    });

    //// popular post carousel
    $(".popular-post-carousel").owlCarousel({
        autoPlay: false,
        pagination: false,
        items: 3,
        itemsDesktop: [1199, 2],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 2],
        itemsMobile: [480, 1],
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']
    });

    /*-----------------------------
    Product Carousel active
    ------------------------------*/
    $(".product-carousel-wrapper").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        items: 4,
        pagination: false,
        navigation: true,
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 3],
        itemsMobile: [767, 1],
    });

    //// Post Gallery
    $(".testimonial-three-wrapper").owlCarousel({
        autoPlay: 4000,
        singleItem: true,
        pagination: false,
        navigation: false,
        transitionStyle: "backSlide"

    });

    /*-----------------------------
    Product Carousel active two
    ------------------------------*/
    $(".product-carousel-wrapper-two, .blog-carousel-wrapper").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 2],
        itemsMobile: [767, 1],
        pagination: false,
        navigation: true,
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
    });

    //// Post Gallery
    $(".widget-testimonial, .testimonial-4-wrapper").owlCarousel({
        autoPlay: 4000,
        singleItem: true,
        pagination: true,
        navigation: false,

    });
    
    /*-----------------------------
    Product Carousel active three
    ------------------------------*/
    $(".product-carousel-wrapper-three").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        itemsDesktop: [1920, 1],
        itemsDesktopSmall: [979, 1],
        itemsTablet: [768, 2],
        itemsMobile: [767, 1],
        pagination: false,
        navigation: true,
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
    });
    
    //// Blog Top Slider carousel
    $("#top-carousel, .doc-wrapper").owlCarousel({
        autoPlay: false,
        slideSpeed: 1000,
        pagination: false,
        navigation: true,
        items: 3,
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [980, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
        afterAction: function(el) {
            ////remove class active
            this.$owlItems.removeClass('active')
                ////add class active
            this.$owlItems ////owl internal $ object containing items
                .eq(this.currentItem + 1).addClass('active')
        }
    });

    /*-----------------------------
    Product Carousel active three full
    ------------------------------*/
    $(".product-carousel-wrapper-3").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        items: 5,
        pagination: false,
        navigation: true,
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 3],
        itemsMobile: [767, 1],
    });
    
    /*-----------------------------
    Product Carousel active four
    ------------------------------*/
    $(".product-carousel-wrapper-4").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        items: 3,
        pagination: false,
        navigation: true,
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 3],
        itemsMobile: [767, 1],
    });

    ////  Product tab carousel
    $(".product-img-tab").owlCarousel({
        autoPlay: false,
        pagination: false,
        items: 4,
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 3],
        itemsMobile: [570, 2],
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']

    });

    //// Restaurant Slider
    $(".restaurant-slider-area").owlCarousel({
        autoPlay: false,
        pagination: true,
        singleItem: true,
        navigation: false,
        transitionStyle: "fade"
    });

    /*--------------------------------------
      Parallax  selector
    ------------------------------------------*/
    $('.parallax-bg-area').parallax("50%", 0.3);

    /*--------------------------------------
      masonry Post Selector
    ------------------------------------------*/
    $('.me-active').masonry({
        itemSelector: '.single-food-menu',
    });

    /*---------------------------
    Price Slider Range 
    -----------------------------*/
    $("#slider-range").slider({
        range: true,
        min: 40,
        max: 600,
        values: [60, 550],
        slide: function(event, ui) {
            $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
        }
    });
    $("#amount").val("$" + $("#slider-range").slider("values", 0) +
        " -- $" + $("#slider-range").slider("values", 1));

    /*----- cart-plus-minus-button -----*/
    $(".dddd").append('<div class="dec qtybutton">-</div><div class="inc qtybutton">+</div>');
    $(".qtybutton").on("click", function() {
        var $button = $(this);
        var oldValue = $button.parent().find("input").val();
        if ($button.text() == "+") {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            //// Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find("input").val(newVal);
    });    

    /*--------------------------------
    Mobile Menu active
    -----------------------------------*/
    $('.mobile-menu').meanmenu();

    /*-----------------------------
    Loader activation here. 
    -------------------------------*/
    $("#fakeloader").fakeLoader({
        timeToHide:1500, 
        zIndex:999999, 
        spinner:"spinner1",   ////Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
        bgColor: "#ffffff",
        ////imagePath: "/Content/themes/linhlinh/img/logo/home-footer.png"
    });

})(jQuery);