// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require forem
//= require underscore
//= require gmaps/google
//= require_tree .


$(function() {
    // Faye channels configuration
    var faye = new Faye.Client('http://localhost:9292/faye');
    faye.subscribe('/users/update', function (data) {
        alert("q: " + data);
    });
    faye.subscribe('/questions/new', function (data) {
        eval(data);
    });
    faye.subscribe('/answers/new', function (data) {
        alert("a: " + data);
    });

    if ($('#map').length > 0) {
        initiateGmaps()
    }

    var ytplayer = document.getElementById("ytPlayer");
    // This causes the updatePlayerInfo function to be called every 250ms to
    // get fresh data from the player
    setInterval(updatePlayerInfo, 250);
    updatePlayerInfo();

    var seconds = 0

    function updatePlayerInfo() {

        seconds = ytplayer.getCurrentTime()
        any_focused = false
        $(".new_question_field").each( function() {
            if ($(this).is(':focus')) {
                any_focused = true
            } else {
                // do nothing
            }
        })
        if (!any_focused) {
            $('#time_counter').val(seconds)
        }
    }

    function abortTimer() { // to be called when you want to stop the timer
        clearInterval(tid);
    }
});

var initiateGmaps = function() {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        markers = handler.addMarkers([
            {
                "lat": 0,
                "lng": 0,
                "picture": {
                    "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
                    "width":  36,
                    "height": 36
                },
                "infowindow": "hello!"
            }
        ]);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    });
}