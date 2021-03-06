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
    // clear error messages on keyup
    $("#artists_search").find('input').keydown(function(){
        $('.validArtist').removeClass('notValidArtist');
    });

    // handle search box submission
    $("#artists_search").submit(function() {
        // console.log($("#artists_search").find("#search").val())
        var searchedArtistVal = $("#artists_search").find("#search").val();
        var artistNameDisplay = $(".artistNameDisplay");
        $.get($("#artists_search").attr("action"), $("#artists_search").serialize(), function(result){
            // console.log('results is ', JSON.stringify(result));
            // if not a valid artist name, display error message
            if(result[0].name === "not a valid artist name"){
                $('.validArtist').addClass('notValidArtist');
            }else{
                // empty search bar
                $("#artists_search").find("#search").val('');

                artistNameDisplay.fadeOut(1000, function(){
                    artistNameDisplay.text(searchedArtistVal);
                });
                var artistCount = {};
                var d3array = [];
                for(var i = 0; i < result.length; i++){
                    artist = result[i].name;
                    if(artistCount[artist] === undefined){
                        artistCount[artist] = 1;
                    }else{
                        artistCount[artist] += 1;
                    }
                }

                for(var i in artistCount){
                    if(artistCount[i] < 3){
                        // if(d3array.other === undefined){
                        //     d3array.push({'label' : 'Other', 'value' : 1, 'showing': 1});
                        // }
                    }else{
                        d3array.push({'label' : i, 'value' : artistCount[i], 'showing': 1});
                    }
                }
                console.log('d3 array is ', JSON.stringify(d3array));
                change(d3array);
                // update name in middle of pie
                artistNameDisplay.fadeIn(1000);
            }
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




