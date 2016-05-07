"use strict";
(function(){

    /* Index effects */

    // $('#index-logo .logo').fadeIn('fast');
    $('#index-logo .logo h1').delay(200).fadeTo('slow', 1);
    $('#index-logo .logo #logo-desc').delay(700).fadeTo('slow', 1);
    $('#index-logo .navigation').delay(1000).fadeTo('slow', 1);

    $('.main-container').delay(200).fadeTo('slow', 1);
    // for(var i = 1; i < 7; i++){
    //     $('#project-' + i).delay(200).fadeTo('slow', 1);
    // }

})();
