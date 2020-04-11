$(document).ready(function(){
    if($('.provider-slider')){
      $('.provider-slider').each(function () {
        $(this).slick({
            infinite: true,
            variableWidth: true,
            dots: false,
            arrows: true,
            swipeToSlide: true,
            autoplay: true, 
            autoplaySpeed: 1500,
            prevArrow: $('.provider-slider-controls .prev'),
            nextArrow: $('.provider-slider-controls .next'),
        });
      });
    }

    if($('#slider-centered')){
        $('#slider-centered').slick({
            centerMode: true,
            arrows: true,
            dots: false,
            centerPadding: "0px",
            slidesToShow: 3,
            speed: 300,
            prevArrow: $('.slider-centered-controls .prev'),
            nextArrow: $('.slider-centered-controls .next'),
            responsive: [
              {
                breakpoint: 721,
                settings: {
                  slidesToShow: 1,
                }
              }
            ]
        });

        $("#slider-centered").on("click", ".slider-centered-item", function () {
          var parent = $(this).parent().parent();
      
          if (parent.hasClass("slick-active") && !parent.hasClass("slick-current")) {
            if (parent.next().hasClass("slick-current")) {
              $("#slider-centered").slick("slickPrev");
            } else if (parent.prev().hasClass("slick-current")) {
              $("#slider-centered").slick("slickNext");
            }
          }
        });
    }

    if($('.news-block-slider')){
      $('.news-block-slider').each(function () {
        $(this).slick({
          infinite: true,
          arrows: true,
          dots: false,
          slidesToShow: 4,
          swipeToSlide: true,
          speed: 300,
          prevArrow: $(this).parent().find('.news-block-slider-controls .prev'),
          nextArrow: $(this).parent().find('.news-block-slider-controls .next'),
          responsive: [
            {
              breakpoint: 1201,
              settings: {
                slidesToShow: 3,
              }
            },
            {
              breakpoint: 1025,
              settings: {
                variableWidth: true,
              }
            },
            {
              breakpoint: 421,
              settings: {
                variableWidth: true,
                slidesToShow: 1,
              }
            }
          ]
        });
      });
      
    }

    if($('.js-small-carousel')){
      $('.js-small-carousel').each(function () {
        $(this).slick({
          infinite: true,
          dots: false,
          arrows: true,
          swipeToSlide: true,
          slidesToShow: 5,
          prevArrow: $(this).parent().find('.small-carousel-controls .prev'),
          nextArrow: $(this).parent().find('.small-carousel-controls .next'),
          responsive: [
            {
              breakpoint: 1281,
              settings: {
                slidesToShow: 4,
              }
            },
            {
              breakpoint: 1025,
              settings: {
                slidesToShow: 3,
              }
            },
            {
              breakpoint: 769,
              settings: {
                slidesToShow: 3,
                variableWidth: true,
              }
            }
          ]
        });
      });
    }

    if($('#section-inner-slider')){
      $('#section-inner-slider').slick({
        infinite: true,
        dots: false,
        arrows: true,
        swipeToSlide: true,
        slidesToShow: 3,
        prevArrow: $('#section-inner-slider-controls').find('.prev'),
        nextArrow: $('#section-inner-slider-controls').find('.next'),
        responsive: [
          {
            breakpoint: 961,
            settings: {
              slidesToShow: 2,
            }
          },
          {
            breakpoint: 641,
            settings: {
              slidesToShow: 1,
            }
          }
        ]
      });
    }

    
      
    $('#additional-menu-list').each(function () {
      $(this).slick({
        dots: false,
        arrows: true,
        infinite: false,
        speed: 300,
        variableWidth: true,
        swipe: true,
        slidesToShow: 1,
        swipeToSlide: true,
        prevArrow: $(this).parent().find('.additional-menu-controls .prev'),
        nextArrow: $(this).parent().find('.additional-menu-controls .next'),
      });
    });
      
});