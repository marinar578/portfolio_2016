"use strict";
(function(){

    $('#index-logo .logo').fadeIn('fast');
    $('#index-logo .logo h1').delay(200).slideDown('slow');
    $('#index-logo .logo #logo-desc').delay(1000).fadeIn('slow');

    $('#index-logo .navigation').slideDown('slow');

    $('.main-container').fadeIn('slow');
    for(var i = 1; i < 7; i++){
        $('#project-' + i).delay(200 + (i * 100)).fadeIn('slow');
    }




})();
