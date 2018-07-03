$(document).ready(function () {
// Contacts map
// Google Maps Activation
$("#map").each(function () {
    var map;//,
    //// map_holder = $("#map_holder");
    var coords = {
        hanoi: new google.maps.LatLng(Latitude, Longitude)
    };

    var MY_MAPTYPE_ID = 'studio';

    ////$(window).on("resize", function () {
    ////    map_holder.height($(window).height() - 64 - 49);
    ////});
    ////$(window).trigger("resize");

    function initialize() {

        var stylez = [];

        var mapOptions = {
            zoom: 16,
            center: coords.hanoi,
            disableDefaultUI: true,
            scrollwheel: false,
            scaleControl: false,
            mapTypeControlOptions: {
                mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
            },
            mapTypeId: MY_MAPTYPE_ID
        };

        map = new google.maps.Map(document.getElementById("map"),
            mapOptions);
        var styledMapOptions = {
            name: "nologo_style"
        };

        google.maps.event.addListener(map, 'click', function () {
            map.setOptions({ scrollwheel: true });
        });

        google.maps.event.addListener(map, 'mouseup', function () {
            map.setOptions({ scrollwheel: true });
        });

        google.maps.event.addListener(map, 'mouseout', function () {
            map.setOptions({ scrollwheel: false });
        });

        $.each(coords, function (index, coord) {
            var image = new google.maps.MarkerImage(image_map,
                new google.maps.Size(46, 41),
                new google.maps.Point(0, 0),
                new google.maps.Point(23, 41)
            );

            var marker = new google.maps.Marker({
                position: coord,
                title: '' + title,
                icon: image,
                clickable: false,
                map: map
            });
        });

        var jayzMapType = new google.maps.StyledMapType(stylez, styledMapOptions);

        map.mapTypes.set(MY_MAPTYPE_ID, jayzMapType);
    }

    $(document).ready(function () {
        initialize();
    });
    $(document).on("click", ".city_select a", function () {
        if (!$(this).hasClass("active")) {
            $(".city_select a").removeClass("active");
            $(this).addClass("active");

            var town = $(this).attr("href").replace("#", "");
            map.setZoom(16);
            map.setCenter(coords[town]);
        }
        return false;
    });
});

});