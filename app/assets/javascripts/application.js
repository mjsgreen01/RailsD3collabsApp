// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {
    $("#artists_search").submit(function() {
        // console.log($("#artists_search").find("#search").val())
        var searchedArtist = $("#artists_search").find("#search").val();
        $.get($("#artists_search").attr("action"), $("#artists_search").serialize(), function(result){
            // console.log('results is ', JSON.stringify(result));
            var artistCount = {}
            var d3array = [];
            for(var i = 0; i < result.length; i++){
                artist = result[i].name;
                if(!artistCount[artist]){
                    artistCount[artist] = 1;
                }else{
                    artistCount[artist] += 1;
                }
            }
            // result.each(function(){
            //     artist = $(this);
            //     if(!artistCount[artist]){
            //         artistCount[artist] = 1;
            //     }else{
            //         artistCount[artist] += 1;
            //     }
            // });
            for(var i in artistCount){
                d3array.push({'label' : i, 'value' : artistCount[i]});
            }
            console.log('d3 array is ', JSON.stringify(d3array))


        }, "json");
        $('body').scrollTop(0);
        return false;
    });

    // if ($('.pagination').length) {
    //     $(window).scroll(function() {
    //         var url = $('.pagination .next_page').attr('href');
    //         if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
    //             $('.pagination').text("Please Wait...");
    //             return $.getScript(url);
    //         }
    //     });
    //     return $(window).scroll();
    // }


});




