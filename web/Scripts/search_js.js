
function OnKeyDown(e) {
    var code = (e.keyCode ? e.keyCode : e.which); ////to support both methods
    if (code == 13) { ////the Enter keycode
        var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
        document.getElementById('btnSearch').click();
        validate_search();
        ////return;
                    
    }
}
            
$(function () {
    $('#searchtxt').keydown(OnKeyDown);
});

function validate_search() {
    var te_se = $("#searchtxt").val();
    var myval = document.getElementById('searchtxt').value;
    if (te_se !== null && te_se !== 'undefined' && te_se !== "") {
        te_se = te_se.replace(/(<([^>]+)>)/ig, "");
        window.location.href = search_product_link + '?key=' + encodeURI(te_se);
    }
}


//$(document).ready(function () {
//    $("#btnSearch").bind("click", function () {
//        var code = $('#searchtxt').val();
//        console.log(code);
//    });
//});