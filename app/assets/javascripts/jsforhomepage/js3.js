(function($){
  $(function(){
    $('.contents').height($('.wrapper').height() - $('.header').height());
    var mainSlider = null;
    $(window).on('load', function() {
      $('.flexslider').flexslider({
        slideshowSpeed: 5000,
        animationSpeed: 2000,
        controlNav: false,
        animationLoop: true,
        pauseOnAction: false,
        prevText: '',
        nextText: '',
        start: function(_slider){
          mainSlider = _slider;
          sliderResize($(mainSlider[0]));
          $('.contents').height('auto');
        }
      });
    });

    $('.navi-btn a').on('click', function(e){
      e.preventDefault();
      var target = $('.wrapper-inner');
      if (target.hasClass('active')) {
        target.removeClass('active');
      } else {
        target.addClass('active');
      }
    });

    $('nav a[href="#"]').on('click', function(e){
      e.preventDefault();
    });

    $(window).on('resize', function() {
      if (mainSlider) {
        sliderResize($(mainSlider[0]));
        // mainSlider.flexslider(0)
      }
    });
  });
  function sliderResize(_target) {
    _target.find('.slides li')
      .height($('.wrapper').height() - $('.header').height());
    _target.find('.slides li').each(function(i, v) {
      var imageDom = $(v).find('img');
      var size = {w: '100%', h: 'auto'};
      imageDom.width(size.w).height(size.h);
      if (imageDom.height() < $(v).height()) {
        size = {w: 'auto', h: '100%'};
        imageDom.width(size.w).height(size.h);
      }
      var pos = {
        top: imageDom.height() / 2 * -1,
        left: imageDom.width() / 2 * -1
      };
      imageDom.css({marginTop: pos.top, marginLeft: pos.left});

      var textDom = $(v).find('.slides-text');
      pos = {
        top: textDom.height() / 2 * -1,
        left: textDom.width() / 2 * -1
      };
      textDom.css({marginTop: pos.top, marginLeft: pos.left});
    });

  }
})(jQuery);
