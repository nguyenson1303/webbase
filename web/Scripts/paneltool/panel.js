$(document).ready(function () {
    panelTool();
});

function panelTool() {
    $('#facebook_pannel .panelbutton').click(function () {
        var content_div = "";
        content_div = $('#facebook_pannel .paneltool .panelinner').html();
        if (content_div.length == 0) {
            content_div = "<div id='fb-root'></div><script>$(document).ready(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id))return;js=d.createElement(s);js.id=id;js.src='//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=437999542954198';fjs.parentNode.insertBefore(js,fjs);}(document,'script','facebook-jssdk'));</script>";
            content_div = content_div + "<div class='fb-page' data-href='" + link_facebook + "' data-tabs='timeline' data-width='350' data-height='350' data-small-header='true' data-adapt-container-width='true' data-hide-cover='false' data-show-facepile='false'><blockquote cite='" + link_facebook + "' class='fb-xfbml-parse-ignore'><a href='" + link_facebook + "'></a></blockquote></div>";
            $('#facebook_pannel .paneltool .panelinner').html(content_div);
        }
        $('#facebook_pannel .paneltool').toggleClass('active');
    });
    $('#instagram_pannel .panelbutton').click(function () {
        var content_div = "";
        content_div = $('#instagram_pannel .paneltool .panelinner').html();
        if (content_div.length == 0) {
            ////content_div = "instagram";
            ////$('#instagram_pannel .paneltool .panelinner').html(content_div);
        }
        $('#instagram_pannel .paneltool').toggleClass('active');
    });
    $('#phone_pannel .panelbutton').click(function () {
        var content_div = "";
        content_div = $('#phone_pannel .paneltool .panelinner').html();
        if (content_div.length == 0) {
            content_div = "<div class=\"group-input clearfix\"><label class=\"control-label\"><i class=\"fa fa-phone\"></i>" + link_phone + "</label></div>";
            $('#phone_pannel .paneltool .panelinner').html(content_div);
        }        
        $('#phone_pannel .paneltool').toggleClass('active');
    });
};
