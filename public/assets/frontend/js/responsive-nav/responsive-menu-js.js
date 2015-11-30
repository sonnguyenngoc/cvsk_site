/*( function( window, $, undefined ) {
 'use strict';

 $( 'nav' ).before( '<button class="menu-toggle" role="button" aria-pressed="false"></button>' ); // Add toggles to menus
 $( 'nav .sub-menu' ).before( '<button class="sub-menu-toggle" role="button" aria-pressed="false"></button>' ); // Add toggles to sub menus

 // Show/hide the navigation
 $( '.menu-toggle, .sub-menu-toggle' ).on( 'click', function() {
 var $this = $( this );
 $this.attr( 'aria-pressed', function( index, value ) {
 return 'false' === value ? 'true' : 'false';
 });

 $this.toggleClass( 'activated' );
 $this.next( 'nav, .sub-menu' ).slideToggle( 'fast' );

 });

 })( this, jQuery );*/


/**
 * Menu wrapper - First element that contains all navigation elements
 *
 * Options:
 *
 * easing - animation effect. Check http://gsgd.co.uk/sandbox/jquery/easing/
 * duration - animation duration in ms
 * menuSelector -
 */

+(function ($) {
 'use strict';

	$.fn.responsiveNavMenu = function (options) {

		var DEFAULTS = {
			'easing' 		 : 'easeOutExpo',
			'duration'   	 : 300,
			'menuSelector'   : '#main-navigation',
			'subMenuSelector': '.dropdown-menu',
			'menuToggler'    : 'nav .navbar-toggle',
			'subMenuToggler' : 'nav .sub-navbar-toggle'
		};

		var settings = $.fn.extend(true, {}, DEFAULTS, options);

		// Add Expand collapse menu buttons
		$(settings.menuSelector + ' ' + settings.subMenuSelector).before('<button class="sub-navbar-toggle" role="button" aria-expanded="false"></button>');

		// Buttons for expanding/Collapsing navigation and submenus
		var buttons = $(settings.menuToggler + ',' + settings.subMenuToggler);
		buttons.on('click', function(e){
			var $this = $( this );
			$this.attr( 'aria-expanded', function( index, value ) {
				return 'false' === value ? 'true' : 'false';
			});
			$this.toggleClass( 'active' );

			// Expand/Collapse main navigation (related to mobile version)
			if($this.hasClass("navbar-toggle")){
				$(settings.menuSelector).slideToggle( settings.duration, settings.easing);
			}else{
				// Expand/Collapse submenus
				$this.next(settings.subMenuSelector).slideToggle( settings.duration, settings.easing);
			}
		});

		// we do not need hover effect for touch devices
		if(('ontouchstart' in document) || (('ontouchstart' in document.documentElement))) {
			return this;
		}

		//Hover
		$(settings.menuSelector + " .dropdown").hoverIntent({
			over: function(){
					var $this = $(this);
					if ($this.hasClass("active")) {
						$this.removeClass("active");
					} else {
						$this.addClass("active");
					}
					$this.find("button").trigger("click"); // Button
			      },
			out: function(){
						var $this = $(this);
						if ($this.hasClass("active")) {
							$this.removeClass("active");
						} else {
							$this.addClass("active");
						}
						$this.find("button").trigger("click"); // Button
					},
			timeout: 300
	     });
	} // End of fnc

	$(document).ready(function () {
		$.fn.responsiveNavMenu();
	});
})(jQuery);