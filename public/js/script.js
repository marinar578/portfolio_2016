"use strict";
(function(){

    $('#index-logo .logo').fadeIn('slow');
    $('#index-logo .logo h1').delay(400).slideDown('slow');
    $('#index-logo .logo #logo-desc').delay(1000).fadeIn('slow');


    $('#index-logo .navigation').slideDown('slow')

    $('.main-container').fadeIn('slow')
    for(var i = 1; i < 7; i++){
        $('#project-' + i).delay(i*100).fadeIn('slow');
    }


})();
