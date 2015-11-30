var IS_TOUCH_DEVICE  = ('ontouchstart' in document.documentElement);
var IS_MOBILE_DEVICE = false;
var current_slider   = '';
var TL_ENABLE_COLORS = true;

if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini|Opera Mobile|Kindle|Windows Phone|PSP|AvantGo|Atomic Web Browser|Blazer|Chrome Mobile|Dolphin|Dolfin|Doris|GO Browser|Jasmine|MicroB|Mobile Firefox|Mobile Safari|Mobile Silk|Motorola Internet Browser|NetFront|NineSky|Nokia Web Browser|Obigo|Openwave Mobile Browser|Palm Pre web browser|Polaris|PS Vita browser|Puffin|QQbrowser|SEMC Browser|Skyfire|Tear|TeaShark|UC Browser|uZard Web|wOSBrowser|Yandex.Browser mobile/i.test(navigator.userAgent)
/*&& confirm('Are you on a mobile device?')*/){
    IS_MOBILE_DEVICE = true;
}

// Bugfix for ie10 on win8 OS
if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
    var msViewportStyle = document.createElement('style')
    msViewportStyle.appendChild(
        document.createTextNode(
            '@-ms-viewport{width:auto!important}'
        )
    )
    document.querySelector('head').appendChild(msViewportStyle)
}


$(function() {


    /* -------------------------------------------------------------------------------------------- */
    /* ------------------------------------COLOR SCHEME CHANGER------------------------------------ */
    /* -------------------------------------------------------------------------------------------- */

    if(TL_ENABLE_COLORS){
        ColorShemeController();
    }


    /* -------------------------------------------------------------------------------------------- */
    /* ------------------------------------ S L I D E R S ----------------------------------------- */
    /* -------------------------------------------------------------------------------------------- */

    // First we will preload slides. After preloading. Slider starts.
    $('#slider-wrapper').waitForImages(function() {

        // Create Full Size slider if exists in HTML
        fullSliderBg('.main-slider.full', ".full-slider-wrapper", function(){});

        // Create standard slider if exists in HTML
        fullSliderBg('.bordered-slider-wrapper .main-slider.simple', ".bordered-slider-wrapper", function(){});

        // Create Mazzareli slider if exists in HTML
        mazzareliSlider();
    });


    // Mazzareli slider (Mobile)
    function mazzareliSlider(){

        var mobile_slider            = $('.main-slider.simple');
        var mazzareli_slider_wrapper = $(".main-slider.mazzareli");

        var isSmallScreen  =  (getViewPortWidth() < 993) ? true : false;
        var doMobileSlider =  (IS_MOBILE_DEVICE && getMobileWidth() < 993) ? true : false;

        if(mazzareli_slider_wrapper.length ==0){
            return
        }

        if(doMobileSlider) {

            current_slider = 'mazzareli';
            // Hide Mazzareli slider HTML markup. It can not be shown on small mobile devices
            mazzareli_slider_wrapper.remove();
            // Create Mobile version
            fullSliderBg('.main-slider.simple', ".inner-simple-slider-wrapper", function(){});

        }else if(isSmallScreen){

            current_slider = 'mobile';
            // This could be a deskop, laptop or mobile device with big screen.
            mazzareli_slider_wrapper.css("opacity", 0);
            fullSliderBg('.main-slider.simple', ".inner-simple-slider-wrapper", function(){
                // Create Mazzareli slider
                _mazzareliSlider(mazzareli_slider_wrapper, function(){
                    mazzareli_slider_wrapper.css("position","absolute").css("left", 9999).css("opacity", 1);
                });
            });
        }
        else{ // Big screen

            current_slider = 'mazzareli';

            mobile_slider.parent().css("opacity", 0);
            _mazzareliSlider(mazzareli_slider_wrapper, function(){
                // Do mobile slider
                fullSliderBg('.main-slider.simple', ".inner-simple-slider-wrapper", function(){
                    mobile_slider.parent().parent().css("position","absolute").css("left", 9999).css("opacity", 1);
                });
            });
        }


        if(!doMobileSlider){
            // Do resize window events

            $(window).resize(function(){

                if(getViewPortWidth() < 993 && current_slider !='mobile'){

                    //Hide Mazz
                    mazzareli_slider_wrapper.css("position","absolute").css("left", 9999);
                    // Show mobile slider
                    mobile_slider.parent().parent().css("left", 0).css("position","static");
                    current_slider = 'mobile';

                }else if(getViewPortWidth() > 992 && current_slider !='mazzareli'){
                    // Show Mazz slider
                    mazzareli_slider_wrapper.css("left", 0).css("position","relative");
                    // Hide mobile slider
                    mobile_slider.parent().parent().css("position","absolute").css("left", 9999);
                    current_slider = 'mazzareli';
                }
            });
        }
    }


    // Creates an instance of a Mazzareli slider
    function _mazzareliSlider(slider_wrapper_selector, callback){

        var mazzareli_slider = slider_wrapper_selector.find(".mask-slider");

        if(mazzareli_slider.length > 0) {

            var hide = { subtitle:0, title:0, desc:0, button:0 };
            var show = {subtitle:1, title:1, desc:1, button:1 };

            mazzareli_slider.carouFredSel({
                auto: false,
                align: 'center',
                swipe: { onMouse: true, onTouch: true },
                responsive: true,
                width: "100%",
                height: "variable",
                items:{
                    visible:1,
                    height:330
                },
                scroll: {
                    duration: 1000,
                    easing: "quadratic",
                    fx: "scroll",
                    items: 1
                },
                prev: {
                    button: $(".mask-slider-wrapper .c-previous"),
                    onBefore: function(data){
                        var index = $(this).triggerHandler( 'currentPosition' );
                        //	trigger the titles carousel
                        mazzareli_text_slider.trigger('slideTo', [ index, 'next' ]);
                    }
                },
                next:{
                    button: $(".mask-slider-wrapper .c-next"),
                    onBefore: function(data){
                        var index = $(this).triggerHandler( 'currentPosition' );
                        //	trigger the titles carousel
                        mazzareli_text_slider.trigger('slideTo', [ index, 'next' ]);
                    }
                }
            });

            var mazzareli_text_slider = slider_wrapper_selector.find(".slider-text");
            var isScrolling = false;
            mazzareli_text_slider.carouFredSel({
                scroll	: {
                    duration: 0,
                    timeoutDuration: 3000,
                    items: 1
                },
                auto: false,
                responsive: true,
                height:"variable",
                items:{
                    visible:1,
                    height: "variable"
                },
                /*swipe: {onMouse: true, onTouch: true},*/
                pagination: ".main-slider.mazzareli .c-pagination",
                onCreate: function(){
                    slider_wrapper_selector.css("visibility", "visible");
                    callback();
                },
                prev	: {
                    button: $(".main-slider.mazzareli .cc-previous"),
                    /*conditions	: function() {
                        return (!isScrolling);
                    },*/
                    onBefore	: function( data ) {
                        var index = $(this).triggerHandler( 'currentPosition' );
                        if ( index == 0 ) {
                            index = $(this).children().length;
                        }
                        //	trigger background slider
                        mazzareli_slider.trigger('slideTo', [ index, 'prev' ]);

                        isScrolling = true;
                        $(this).delay(900);	//	delay the onafter

                        //HIDE CURRENT
                        data.items.old.find('h4').animate({ opacity: left.subtitle });
                        data.items.old.find('h2').delay(200).animate({opacity: left.title});
                        data.items.old.find('p').delay(300).animate({ opacity: left.desc});
                        data.items.old.find('a').delay(400).animate({opacity: left.button});

                        //HIDE INCOMING
                        data.items.visible.find('h4').css({ opacity: left.subtitle });
                        data.items.visible.find('h2').css({ opacity: left.title });
                        data.items.visible.find('p').css({ opacity: left.desc });
                        data.items.visible.find('a').css({ opacity: left.button });

                    },
                    onAfter: function( data ) {

                        data.items.old.find('h4').css({ opacity: current.subtitle });
                        data.items.old.find('h2').css({ opacity: current.title });
                        data.items.old.find('p').css({ opacity: current.desc });
                        data.items.old.find('a').css({ opacity: current.button });

                        data.items.visible.find('h4').css({ opacity: right.subtitle }).animate({opacity: 1 });
                        data.items.visible.find('h2').css({ opacity: right.title }).delay(200).animate({ opacity: 1 });
                        data.items.visible.find('p').css({ opacity: right.desc }).delay(300).animate({ opacity: 1 });
                        data.items.visible.find('a').css({ opacity: right.button }).delay(400).animate({ opacity: 1 }, function() {
                            isScrolling = false;
                        });
                    }
                },
                next	: {
                    button: $(".main-slider.mazzareli .cc-next"),
                    /*conditions	: function() {
                        return (!isScrolling);
                    },*/
                    onBefore	: function( data ) {

                        var index = $(this).triggerHandler( 'currentPosition' );
                        if ( index == 0 ) {
                            index = $(this).children().length;
                        }
                        //	trigger background slider
                        mazzareli_slider.trigger('slideTo', [ index, 'next' ]);

                        isScrolling = true;
                        $(this).delay(900);	//	delay the onafter

                        //HIDE INCOMING
                        data.items.visible.find('h4').css({ opacity: hide.subtitle });
                        data.items.visible.find('h2').css({ opacity: hide.title });
                        data.items.visible.find('p').css({ opacity: hide.desc });
                        data.items.visible.find('a').css({ opacity: hide.button });

                        data.items.old.find('h4').animate({ opacity: hide.subtitle });
                        data.items.old.find('h2').delay(200).animate({opacity: hide.title});
                        data.items.old.find('p').delay(300).animate({ opacity: hide.desc});
                        data.items.old.find('a').delay(400).animate({opacity: hide.button});

                    },
                    onAfter: function( data ) {
                        data.items.old.find('h4').css({ opacity: show.subtitle });
                        data.items.old.find('h2').css({ opacity: show.title });
                        data.items.old.find('p').css({ opacity: show.desc });
                        data.items.old.find('a').css({ opacity: show.button });

                        data.items.visible.find('h4').css({ opacity: hide.subtitle }).animate({opacity: show.subtitle });
                        data.items.visible.find('h2').css({ opacity: hide.title }).delay(200).animate({ opacity: show.title });
                        data.items.visible.find('p').css({ opacity: hide.desc }).delay(300).animate({ opacity: show.desc });
                        data.items.visible.find('a').css({ opacity: hide.button }).delay(400).animate({ opacity: show.button }, function() {
                            isScrolling = false;
                        });
                    }
                }
            });
        }
    }


    // Full width slider with background
    function fullSliderBg(selector, wrapper_selector, callback){

        var full_slider = $(selector);
        var show = { subtitle:1, title:1, desc:1, button:1};
        var hide = { subtitle:0, title:0, desc:0, button:0};

        if(full_slider.length > 0) {

            var isScrolling = false;
            full_slider.carouFredSel({
                auto: false,
                align: 'center',
                swipe: {onMouse: true, onTouch: true},
                responsive: true,
                scroll: {
                    fx:'uncover',
                    duration: 1500,
                    easing: "quadratic",
                    items:1,
                    conditions	: function() {
                        return (!isScrolling);
                    },
                    onBefore	: function( data ) {

                        isScrolling = true;
                        $(this).delay(900);	//	delay the onafter

                        data.items.old.find('h4').delay(400).animate({ opacity: hide.subtitle });
                        data.items.old.find('h2').delay(200).animate({opacity: hide.title});
                        data.items.old.find('p').delay(100).animate({ opacity: hide.desc});
                        data.items.old.find('a').animate({opacity: hide.button});

                        data.items.visible.find('h4').css("opacity", hide.subtitle);
                        data.items.visible.find('h2').css("opacity", hide.title);
                        data.items.visible.find('p').css("opacity", hide.desc);
                        data.items.visible.find('a').css("opacity", hide.button);

                    },
                    onAfter: function( data ) {

                        data.items.old.find('h4').css({opacity: show.subtitle });
                        data.items.old.find('h2').css({opacity: show.title});
                        data.items.old.find('p').css({ opacity: show.desc });
                        data.items.old.find('a').css({ opacity: show.button});

                        data.items.visible.find('h4').css({ opacity: hide.subtitle }).delay(400).animate({opacity: show.subtitle }, function(){
                            isScrolling = false;
                        });

                        data.items.visible.find('h2').css({ opacity: hide.title }).delay(200).animate({ opacity: show.title });
                        data.items.visible.find('p').css({ opacity: hide.desc }).delay(100).animate({ opacity: show.desc });
                        data.items.visible.find('a').css({ opacity: hide.button }).animate({ opacity: show.button }, function() {
                            isScrolling = false;
                        });
                    }
                },
                onCreate: function (data) {
                    $('.main-slider').css('visibility', 'visible');
                    callback();
                },
                items:{
                    visible:1
                },
                prev	: $(selector).parent().find(".cc-previous"),
                next	: $(selector).parent().find(".cc-next"),
                pagination: wrapper_selector + " .c-pagination",
                width: "100%",
                height: "variable",
                items: {
                    visible:1,
                    height: "variable"
                }
            });
        }
    }




    /* ------------------------------------------------------------------------------------------------ */
    /* ------------------------------------ Carousel at home page  ------------------------------------ */
    /* ------------------------------------------------------------------------------------------------ */


    if($(".tl-carousel").length){

        $(".tl-carousel").waitForImages(function() {
            $(".tl-carousel").carouFredSel({
                auto: false,
                align: 'center',
                prev: {
                    button: $('.tl-carousel-wrapper .c-previous')
                },
                next: {
                    button: $('.tl-carousel-wrapper .c-next')
                },
                swipe: {
                    onMouse: true,
                    onTouch: true
                },
                pagination:".tl-carousel-wrapper .c-pagination",
                scroll:{
                    easing:"quadratic",
                    duration: 1500
                },
                onCreate: function(data) {
                    $(".tl-carousel").css('visibility', 'visible');
                },
                responsive:true,
                items:{ visible : {min:1, max:4},
                    width   : 350,
                    height  : "variable",
                    minimum : 1 }
            });
        });
    }



    /* ------------------------------------------------------------------------------------------------ */
    /* -------------------------------------- Card Menu staff ----------------------------------------- */
    /* ------------------------------------------------------------------------------------------------ */

    if($.fn.bxSlider){
        // Init slider load
        var bx_slider = bl_bx_slider();
        $(window).on("orientationchange resize", function () {
            bl_bx_slider(bx_slider);
        });
    }

    /* Create a slider for card menu */
    function bl_bx_slider(slider){

        if(!$(".card-menu-wrapper").length){
            return false;
        }

        // Default num of slides
        var num_of_slides = getGridSize();

        if(!IS_TOUCH_DEVICE){
            var mouseY = 0;
            jQuery(".card-menu-wrapper").mousemove(function(e){
                mouseY = e.pageY - jQuery(this).offset().top - 100;
            });

            // Tracking arrows
            var followers = $(".card-menu-wrapper .prev-page,.card-menu-wrapper .next-page");
            var yp = 0;

            var loop = setInterval(function () {

                menu_container_height = jQuery(".card-menu-wrapper").height();

                if (mouseY < 90) {
                    mouseY = 90;
                } else if (mouseY > menu_container_height - 210) {
                    mouseY = menu_container_height - 210;
                }

                step = (mouseY - yp) / 12;
                yp += step;
                if (Math.abs(step) > .5) {
                    followers.css('top', yp);
                }
            }, 30);
        }

        var OPTIONS={
            minSlides: num_of_slides,
            maxSlides: 2,
            moveSlides:num_of_slides,
            slideWidth:5000,
            easing:"easeInOutExpo",
            pager:false,
            controls:false,
            onSliderLoad: function(){
                // Set carousel visible
                $(".card-menu").css("visibility", "visible");
            }
        };

        if(typeof slider != "undefined" ){
            slider.reloadSlider(OPTIONS);
            return;
        }
        var card_menu_slider = $('.card-menu').bxSlider(OPTIONS);

        jQuery(".card-menu-wrapper .next-page").click(function(){
            card_menu_slider.goToNextSlide();
            return false;
        });
        jQuery(".card-menu-wrapper .prev-page").click(function(){
            card_menu_slider.goToPrevSlide();
            return false;
        });
        return card_menu_slider;
    }

    /* Calculates number of menu card pages to show */
    function getGridSize() {
        return (window.innerWidth < 767) ? 1 : 2;
    }



    /* ------------------------------------------------------------------------------------------------ */
    /* -------------------------------------------- Gallery ------------------------------------------- */
    /* ------------------------------------------------------------------------------------------------ */

    $("a[rel^='prettyPhoto']").prettyPhoto({
            changepicturecallback: function () {
                // Removes social icons
                $('.twitter').empty();
                $('.facebook').empty();
            }
        });


    /* ------------------------------------------------------------------------------------------------ */
    /* ---------------------------- All forms should have floatable labels ---------------------------- */
    /* ------------------------------------------------------------------------------------------------ */

    $('.float-label').floatlabel();


    /* ------------------------------------------------------------------------------------------------ */
    /* ------------------------------------- Make select boxes nicer --------------------------------- */
    /* ------------------------------------------------------------------------------------------------- */

    if($.fn.selectpicker){
        if(IS_MOBILE_DEVICE){
            $('select').selectpicker('mobile');
        }else{
            $('select').selectpicker();
        }
        $('select').on('change', function(){
            $next = $(this).next();
            $next.find("span.filter-option").addClass('selected');
        });
    }


    /* ------------------------------------------------------------------------------------------------ */
    /* ----------------------------------------Date Picker--------------------------------------------- */
    /* ------------------------------------------------------------------------------------------------ */

    if($.fn.datetimepicker){
        $('.datepicker').datetimepicker();
    }


    /* ------------------------------------------------------------------------------------------------ */
    /* ------------------------- Placeholder fix for older browsers (ie9 fix) ------------------------- */
    /* ------------------------------------------------------------------------------------------------ */

    $('input, textarea').placeholder();



    /* ------------------------------------------------------------------------------------------------ */
    /* -- Form Handlers --                                                                              */
    /* ------------------------------------------------------------------------------------------------ */

    $("form .reset-form").on("click", function(e){
        e.preventDefault();
        var $form = $(this).parents("form:first");
        $form[0].reset();
        $form.find("input[type='text'], textarea, select").blur();
    });



    /* ------------------------------------------------------------------------------------------------ */
    /* -------------------------------------- Contact form handler ------------------------------------ */
    /* ------------------------------------------------------------------------------------------------ */

    $(".contact-us-form a.submit").on("click", function(e){
        e.preventDefault();

        var $form = $(this).parents("form");
        var data  = $form.serialize();

        $.ajax({
            url:"php/mail.php",
            type:"POST",
            dataType:"json",
            data: data,
            beforeSend: function(){
                //Clear form
                $form.parent().find(".system-message").fadeOut("fast", function(){
                    $(this).remove();
                });
                $form.find(":input").css("border", "1px solid #ccc");
            },
            success: function(data, status){

                var message = $('<div class="system-message"><p class="message aligncenter"></p></div>');
                message.find("p").addClass('success').html(data.msg);
                $form.before(message);

                if(data.err == 1){
                    $form.parent().find(".system-message p").removeClass('success').addClass('error');
                    if(data.fields){
                        $.each(data.fields, function(i, v){
                            $form.find(":input[name='" + v + "']").css("border", "1px solid red");
                        });
                    }
                }
                $form.parent().find(".system-message").fadeIn(700);
            },
            error: function(jqXHR, status){
                var message = $('<div class="system-message"><p class="message aligncenter"></p></div>');
                message.find("p").addClass('error').html(data.msg);
                $form.before(message);
            }
        });
    });


    /* ------------------------------------------------------------------------------------------------ */
    /* ---------------------------------- Reservation form handler ------------------------------------ */
    /* ------------------------------------------------------------------------------------------------ */

    //Submit form
    $(".reservation-form a.submit").on("click", function(e){

        e.preventDefault();

        var $form = $(this).parents("form");
        var data  = $form.serialize();

        $.ajax({
            url:"php/mail.php",
            type:"POST",
            dataType:"json",
            data: data,
            beforeSend: function(){
                //Clear form
                $form.parent().find(".system-message").fadeOut("fast", function(){
                    $(this).remove();
                });
                $form.find(":input").css("border", "1px solid #ccc");
            },
            success: function(data, status){

                var message = $('<div class="system-message"><p class="message aligncenter"></p></div>');
                message.find("p").addClass('success').html(data.msg);
                $form.before(message);

                if(data.err == 1){
                    $form.parent().find(".system-message p").removeClass('success').addClass('error');
                    if(data.fields){
                        $.each(data.fields, function(i, v){
                            $form.find(":input[name='" + v + "']").css("border", "1px solid red");
                        });
                    }
                }
                $form.parent().find(".system-message").fadeIn(700);
            },
            error: function(jqXHR, status){
                var message = $('<div class="system-message"><p class="message aligncenter"></p></div>');
                message.find("p").addClass('error').html(data.msg);
                $form.before(message);
            }
        });
    });


    /* ------------------------------------------------------------------------------------------------ */
    /* ----------------------------------------  H E L P E R S ---------------------------------------- */
    /* ------------------------------------------------------------------------------------------------ */

    function getOrientation(){
        return Math.abs(window.orientation) - 90 == 0 ? "landscape" : "portrait";
    };
    function getMobileWidth(){
        return getOrientation() == "landscape" ? screen.availHeight : screen.availWidth;
    };
    function getMobileHeight(){
        return getOrientation() == "landscape" ? screen.availWidth : screen.availHeight;
    };

    function getViewPortWidth(){
        return window.innerWidth;
    }


    /*
     * Color Scheme Picker
     */
    function ColorShemeController(){
        var colors        = ["black", "grey", "coffee", "deep-blue", "blue", "turquoise", "green", "lime", "purple", "pink", "yellow"];
        var default_color = "turquoise";
        if($.cookie("css")) {
            $("link.changeme").attr("href", $.cookie("css"));
        }
        var c_list = $("<ul id='c_scheme'></ul>");
        $.each(colors, function(index, value){
            c_list.append('<li><a href="#" class="' +value+ '"></a></li>');
        });
        $("body").append(c_list);
        $("#c_scheme li a").click(function() {
            $(this).parent().parent().find("a").css("opacity", 1);
            $(this).css("opacity", 0.3);
            var css_path = "assets/css/color-shemes/" + $(this).attr('class') + "/" + $(this).attr('class') + ".css";
            $("link.changeme").attr("href", css_path);
            $.cookie("css", css_path, {expires: 365, path: '/'});
            return false;
        });
    }
});