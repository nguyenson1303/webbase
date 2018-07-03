setTimeout(function () {
    $('.load-delay').each(function () {
        var imagex = $(this);
        var imgOriginal = imagex.data('original');
        $(imagex).attr('src', imgOriginal);
    });
}, 1000);

var pa = $('#param');
if (typeof pa !== 'undefined' && pa !== null) {
    var params = $('#param').val();
    if (typeof params !== 'undefined') {
        var arr_param = params.split(';');
        $.each(arr_param, function (index, value) {
            if (value !== "") {
                var arr_property = value.split(',');
                $.each(arr_property, function (index, value) {
                    $("div#property_box input[id='" + value + "']").prop('checked', true);
                });
            }

        });
    }
}


function AddToCart(id, no, caller) {
    caller.html("<img class=\"lazyOwl\" style=\"width: 22px;margin: 0 auto;\" src=\"/images/icon/ring.gif\">");
    var listPro = "";
    var quality_number = $('#quality_number').val();
    if (typeof quality_number !== 'undefined') {
        no = quality_number;
    }
    listPro = ",";
    if (typeof $("select#option_color option").filter(":selected").val() !== 'undefined' && typeof $("select#option_size option").filter(":selected").val() !== 'undefined') {
        listPro = $("select#option_color option").filter(":selected").val() + "," + $("select#option_size option").filter(":selected").val(); 
    }
    $.ajax({
        type: 'POST',
        url: link_add_cart,
        data: '{ID: "' + id + '",No: "' + no + '",listProperties: "' + listPro + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (results) {
            if (typeof results !== 'undefined' && results !== null) {
                $('#subtt').text(" " + results.split("|")[4]);
                $('#counttt').text(" (" + results.split("|")[5] + ")");
                var data = results.split("|")[6];
                var cart_sidebar = $("#cart-sidebar");
                $("#cart-sidebar").html("");
                var arr_from_json = JSON.parse(data);
                var li_item = "";
                $.each(arr_from_json, function (i, obj) {
                    
                    li_item = li_item + "<div class=\"single-cart-product fix\">";
                    li_item = li_item + "    <a href=\"" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "\"><img src=\"" + obj.m_ImagePath + "\" alt=\"" + obj.m_ProductName + "\" style=\"width:58px\"></a>";
                    li_item = li_item + "    <div class=\"cart-details\">";
                    li_item = li_item + "        <h5><a href=\"" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "\">" + obj.m_ProductName + "</a></h5>";
                    li_item = li_item + "        <p>" + obj.m_Quantity + " <span class=\"pull-right\">x" + obj.Price_Format_money + "</span></p>";
                    li_item = li_item + "        <a class=\"remove-item\" onclick=\"RemoveFromCart('Pro_" + obj.m_ProductID + "_" + obj.Property + "',$(this))\"><i class=\"fa fa-times\"></i></a>";
                    li_item = li_item + "    </div>";
                    li_item = li_item + "</div>";

                });
                cart_sidebar.append(li_item);
                show_cart_mini();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            ////alert(errorThrown + ";" + textStatus);
        }
    });

    clearTimeout(window.timer);
    window.timer = setTimeout(function () { 
        caller.html("<i class=\"fa fa-shopping-cart\"></i>");
        $(".cart-contents").click();
    }, 1500);
    
}

function RemoveFromCart(key, caller) {
    caller.html("<img class=\"lazyOwl\" style=\"width: 22px;margin: 0 auto;\" src=\"/images/icon/ring.gif\">");
    
    $.ajax({
        type: 'POST',
        url: link_remove_from_cart,
        data: '{key: "' + key + '"}',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (results) {
            if (typeof results !== 'undefined' && results !== null) {
                $('#subtt').text(" " + results.split("|")[4]);    ////total
                $('#counttt').text(" (" + results.split("|")[5] + ")"); ////count
                $('#subtt2').text(" " + results.split("|")[4]);   ////total
                $('#subtt3').text(" " + results.split("|")[3]);   ////total string
                $('#subtt4').text(" " + results.split("|")[0]);   ////sub total
                $('#subtt5').text(" " + results.split("|")[1]);   ////tax
                $('#subtt6').text(" " + results.split("|")[2]);   ////fee ship
                var data = results.split("|")[6];   ////data
                var cart_sidebar = $("#cart-sidebar");
                $("#cart-sidebar").html("");
                var cart_full_list = $("#cart_full_list");
                $("#cart_full_list").html("");
                var arr_from_json = JSON.parse(data);
                var li_item = "";
                var li_item_full = "";
                $.each(arr_from_json, function (i, obj) {

                    li_item = li_item + "<div class=\"single-cart-product fix\">";
                    li_item = li_item + "    <a href=\"" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "\"><img src=\"" + obj.m_ImagePath + "\" alt=\"" + obj.m_ProductName + "\" style=\"width:58px\"></a>";
                    li_item = li_item + "    <div class=\"cart-details\">";
                    li_item = li_item + "        <h5><a href=\"" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "\">" + obj.m_ProductName + "</a></h5>";
                    li_item = li_item + "        <p>" + obj.m_Quantity + " <span class=\"pull-right\">x" + obj.Price_Format_money + "</span></p>";
                    li_item = li_item + "        <a class=\"remove-item\" onclick=\"RemoveFromCart('Pro_" + obj.m_ProductID + "_" + obj.Property + "',$(this))\"><i class=\"fa fa-times\"></i></a>";
                    li_item = li_item + "    </div>";
                    li_item = li_item + "</div>";

                    li_item_full = li_item_full + "<tr>";
                    li_item_full = li_item_full + "<td class=\"card_product_image\" data-th=\"Image\"><a href=\"#\">";
                    li_item_full = li_item_full + "     <img title=\"" + obj.m_ProductName + "\" alt=\"" + obj.m_ProductName + "\" src=\"" + obj.m_ImagePath + "\" height=\"210px\"></a></td>";
                    ////li_item_full = li_item_full + "<td class=\"card_product_name\" data-th=\"Product Name\"><a href='" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "'>" + obj.m_ProductName + "</a>" + obj.Property_detail + "</td>";
                    li_item_full = li_item_full + "<td class=\"card_product_name\" data-th=\"Product Name\"><a href='" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "'>" + obj.m_ProductName + "</a></td>";
                    li_item_full = li_item_full + "<td class=\"card_product_quantity\" data-th=\"Quantity\">";
                    li_item_full = li_item_full + "     <input type=\"number\" min=\"1\" value=\"" + obj.m_Quantity + "\" name=\"Qty_" + obj.m_ProductID + "\" id=\"Qty_" + obj.m_ProductID + "\" class=\"styler\" style=\"width:50px;\">";
                    li_item_full = li_item_full + "     &nbsp;&nbsp;<a onclick=\"UpdateNumberProductCart('Pro_" + obj.m_ProductID + "_" + obj.Property + "'," + obj.m_ProductID + ",$(this))\"><i class=\"fa fa-refresh\"></i> </a>";
                    li_item_full = li_item_full + "</td>";
                    li_item_full = li_item_full + "<td class=\"card_product_price\" data-th=\"Unit Price\">" + obj.Price_Format_money + "</td>";
                    li_item_full = li_item_full + "<td class=\"card_product_total\" data-th=\"Total\">" + obj.Total_Format_money + "</td>";
                    li_item_full = li_item_full + "<td class=\"card_product_model\" data-th=\"Model\"><a onclick=\"RemoveFromCart('Pro_" + obj.m_ProductID + "_" + obj.Property + "',$(this))\"><i class=\"fa fa-times\"></i></td>";
                    li_item_full = li_item_full + "</tr>";
                });
                cart_sidebar.append(li_item);
                cart_full_list.append(li_item_full);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            ////alert(errorThrown + ";" + textStatus);
        }
    });

    clearTimeout(window.timer);
    window.timer = setTimeout(function () {
        ////caller.html("<i class=\"ion-ios-close-outline\"></i>");
        $(".cart-contents").click();
    }, 1500);

}

function UpdateNumberProductCart(key,id, caller) {
    caller.html("<img class=\"lazyOwl\" style=\"width: 22px;margin: 0 auto;\" src=\"/images/icon/ring.gif\">");
    var quality_number = $('#Qty_'+id).val();
    if (typeof quality_number !== 'undefined') {
        no = quality_number;
    }
    $.ajax({
        type: 'POST',
        url: link_update_product_number_cart,
        data: '{key: "' + key + '",no: "'+ no +'"}',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (results) {
            if (typeof results !== 'undefined' && results !== null) {
                $('#subtt').text(" " + results.split("|")[4]);    ////total
                $('#counttt').text(" (" + results.split("|")[5] + ")"); ////count
                $('#subtt2').text(" " + results.split("|")[4]);   ////total
                $('#subtt3').text(" " + results.split("|")[3]);   ////total string
                $('#subtt4').text(" " + results.split("|")[0]);   ////sub total
                $('#subtt5').text(" " + results.split("|")[1]);   ////tax
                $('#subtt6').text(" " + results.split("|")[2]);   ////fee ship
                var data = results.split("|")[6];   ////data
                var cart_sidebar = $("#cart-sidebar");
                $("#cart-sidebar").html("");
                var cart_full_list = $("#cart_full_list");
                $("#cart_full_list").html("");
                var arr_from_json = JSON.parse(data);
                var li_item = "";
                var li_item_full = "";
                $.each(arr_from_json, function (i, obj) {
                    li_item = li_item + "<div class=\"single-cart-product fix\">";
                    li_item = li_item + "    <a href=\"" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "\"><img src=\"" + obj.m_ImagePath + "\" alt=\"" + obj.m_ProductName + "\" style=\"width:58px\"></a>";
                    li_item = li_item + "    <div class=\"cart-details\">";
                    li_item = li_item + "        <h5><a href=\"" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "\">" + obj.m_ProductName + "</a></h5>";
                    li_item = li_item + "        <p>" + obj.m_Quantity + " <span class=\"pull-right\">x" + obj.Price_Format_money + "</span></p>";
                    li_item = li_item + "        <a class=\"remove-item\" onclick=\"RemoveFromCart('Pro_" + obj.m_ProductID + "_" + obj.Property + "',$(this))\"><i class=\"fa fa-times\"></i></a>";
                    li_item = li_item + "    </div>";
                    li_item = li_item + "</div>";
                                        
                    li_item_full = li_item_full + "<tr class=\"cart_item\">";
                    li_item_full = li_item_full + "<td class=\"product-thumbnail\" data-th=\"Image\"><a href=\"#\">";
                    li_item_full = li_item_full + "     <img title=\"" + obj.m_ProductName + "\" alt=\"" + obj.m_ProductName + "\" src=\"" + obj.m_ImagePath + "\" width=\"150\" height=\"150\" class=\"attachment-shop_thumbnail wp-post-image\"></a></td>";
                    ////li_item_full = li_item_full + "<td class=\"product-name\" data-th=\"Product Name\"><a href='" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "'>" + obj.m_ProductName + "</a>" + obj.Property_detail + "</td>";
                    li_item_full = li_item_full + "<td class=\"product-name\" data-th=\"Product Name\"><a href='" + link_product_detail + "/" + obj.m_ProductID + "/" + obj.m_ProductLink + "'>" + obj.m_ProductName + "</a></td>";
                    li_item_full = li_item_full + "<td class=\"product-quantity\" data-th=\"Quantity\">";
                    li_item_full = li_item_full + "     <input type=\"number\" min=\"1\" value=\"" + obj.m_Quantity + "\" name=\"Qty_" + obj.m_ProductID + "\" id=\"Qty_" + obj.m_ProductID + "\" class=\"styler\" style=\"width:50px;\">";
                    li_item_full = li_item_full + "     &nbsp;&nbsp;<a onclick=\"UpdateNumberProductCart('Pro_" + obj.m_ProductID + "_" + obj.Property + "'," + obj.m_ProductID + ",$(this))\"><i class=\"fa fa-refresh\"></i> </a>";
                    li_item_full = li_item_full + "</td>";
                    li_item_full = li_item_full + "<td class=\"product-price\" data-th=\"Unit Price\">" + obj.Price_Format_money + "</td>";
                    li_item_full = li_item_full + "<td class=\"product-subtotal\" data-th=\"Total\">" + obj.Total_Format_money + "</td>";
                    li_item_full = li_item_full + "<td class=\"product-remove\" data-th=\"Model\"><a onclick=\"RemoveFromCart('Pro_" + obj.m_ProductID + "_" + obj.Property + "',$(this))\" class=\"remove\"><i class=\"fa fa-times\"></i></td>";
                    li_item_full = li_item_full + "</tr>";
                });
                cart_sidebar.append(li_item);
                cart_full_list.append(li_item_full);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            ////alert(errorThrown + ";" + textStatus);
        }
    });

    clearTimeout(window.timer);
    window.timer = setTimeout(function () {
        ////caller.html("<i class=\"ion-refresh\"></i>");
        ////$(".mini-card-icon").click();
    }, 2000);

}

function AddToCompare(id, act, caller) {
    caller.html("<img class=\"lazyOwl\" style=\"width: 22px;margin: 0 auto;\" src=\"/images/icon/ring.gif\">");
    $.ajax({
        type: 'POST',
        url: link_add_compare, 
        data: '{id: "' + id + '",act: "' + act + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (results) {
            if (typeof results !== 'undefined' && results !== null) {
                if (act === "2")
                {
                    var colToHide = $('table tr').find("#" + id);
                    $(colToHide).toggle();
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            ////alert(errorThrown + ";" + textStatus);
        }
    });
    clearTimeout(window.timer);
    window.timer = setTimeout(function () { 
        caller.html("<i class=\"fa fa-files-o\"></i>");
    }, 500);
}

function ProcessWishlish(id, act, caller) {
    caller.html("<img class=\"lazyOwl\" style=\"width: 22px;margin: 0 auto;\" src=\"/images/icon/ring.gif\">");
    $.ajax({
        type: 'POST',
        url: link_add_wishlist, 
        data: '{id: "' + id + '",act: "' + act + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (results) {
            if (typeof results !== 'undefined' && results !== null) {
                if (act === "2") {
                    var colToHide = $('table').find("#" + id);
                    $(colToHide).toggle();
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            ////alert(errorThrown + ";" + textStatus);
        }
    });
    clearTimeout(window.timer);
    window.timer = setTimeout(function () {
        caller.html("<i class=\"fa fa-heart-o\"></i>");
    }, 2000);
}

function loading() {
    $('#loading2').show();
    
    var _box = $("#loading2");
    var _boxImg = $("#img_loading");

    var _widthSite = $(window).width();
    var _heightSite = $(window).height();

    if (_widthSite <= 600) {
        $("#img_loading").css({ "width": "300px" });
    }

    var _widthImg = _boxImg.width();
    var _heightImg = _boxImg.height();

    var _left = ((parseInt(_widthSite) - parseInt(_widthImg)) / 2);
    var _top = ((parseInt(_heightSite) - parseInt(_heightImg)) / 2);

    $(_box).css({
        "background": "rgba(29,26,26,0.50)",
        "display": "block !important",
        "position": "absolute",
        "vertical-align": "middle",
        "z-index": "10000",
        "width": "" + _widthImg + "px",
        "height": "" + _heightImg + "px",
        "left": "" + _left + "px",
        "top": "" + _top + "px"
    });

    $(".icon").css({
        "background": "#998d6c url('/images/icon/350.GIF') no-repeat",
        "background-size": "cover"
    });

}
function UnLoading() {
    $('#loading2').hide(400);

    $('.icon').fadeTo('slow', 0.3, function () {
        $(this).css({
            "background": "url('/html/local/templates/emka/i/sprite.png') no-repeat",
            "position": "absolute",
            "content": "\0000a0",
            "display": "block",
            "background-position": "-425px -50px"
        });
    }).delay(1000).fadeTo('slow', 1);
}

function Add_rating(item_id, rating,name,email,contents,code) {
    ////caller.html("<i class=\"ion-android-sync\"></i>");
    $.ajax({
        type: 'POST',
        url: link_rating,
        data: '{item_id: "' + item_id + '",rating: "' + rating + '",name: "' + name + '",email: "' + email + '",contents: "' + contents + '",code: "' + code + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (results) {
            if (typeof results !== 'undefined' && results !== null) {
                var data = results;
                var review_lst = $("#review_lst");
                $("#review_lst").html("");
                var arr_from_json = JSON.parse(data);
                var li_item = "";
                $.each(arr_from_json, function (i, obj) {


                    li_item = li_item + "<li class=\"comment\">";
                    li_item = li_item + "    <div class=\"comment_container\">";
                    ////li_item = li_item + "        <img src=\"images/avatars/1.png\" class=\"avatar\">");
                    li_item = li_item + "        <div class=\"comment-text\">";
                    li_item = li_item + "            <div class=\"meta\">";
                    li_item = li_item + "                <strong>" + decodeURI(obj.name) + "</strong>";
                    li_item = li_item + "                <p class=\"reating-review\"><span>";
                    var start = parseInt(obj.Rating);
                    li_item = li_item + "<a class=\"star-"+ start +"\">1</a>";
                    ////var other = 5 - start;
                    ////for (jj = 0; jj < start; jj++) {
                    ////    li_item = li_item + "<i class=\"fa fa-star\"></i>";
                    ////}
                    ////for (ii = 0; ii < other; ii++) {
                    ////    li_item = li_item + "<i class=\"fa fa-star-o\"></i>";
                    ////}                           
                    li_item = li_item + "                </span></p>";
                    li_item = li_item + "            </div>";
                    li_item = li_item + "            <div class=\"description\">";
                    li_item = li_item + "                <p>" + decodeURI(obj.contents) + "</p>";
                    li_item = li_item + "            </div>";
                    li_item = li_item + "        </div>";
                    li_item = li_item + "    </div>";
                    li_item = li_item + "</li>";

                });
                review_lst.append(li_item);
                $("#inputName").val();
                $("#inputEmail").val();
                $("#inputContents").val();
                $("#captcha_text").val();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            ////alert(errorThrown + ";" + textStatus);
        }
    });

    ////clearTimeout(window.timer);
    ////window.timer = setTimeout(function () {
    ////    caller.html("<i class=\"ion-ios-cart-outline\"></i>");
    ////    $(".mini-card-icon").click();
    ////}, 2000);

}

function getip() {
    $.getJSON("http://jsonip.appspot.com?callback=?",
       function (data) {
           alert("Your ip: " + data.ip);
       });
}
$(function() {
$.mask.definitions['~'] = '[+-]';
$('.input-mask-date').mask('99/99/9999');

});

function show_cart_mini() {
    $('#div_cart_mini').show();
    ////if ($(window).width() + kt_get_scrollbar_width() >= 768) {
        ////if ($('body').hasClass('home')) {
            ////Open directly via API
            $.magnificPopup.open({
                items: {
                    src: '' + $('#div_cart_mini').html(),  ////can be a HTML string, jQuery object, or CSS selector
                    type: 'inline'
                }
            });
        ////}
    ////}
}

function email_input() {
    var email = $('#input_email').val();
    var name = $('#input_name').val();
    var address = $('#input_address').val();
    var phone = $('#input_phone').val();
    var note = $('#input_note').val();
    $.ajax({
        type: 'POST',
        url: email_marketing,
        data: '{email: "' + (email !== undefined ? email : "") + '", name: "' + (name !== undefined ? name : "") + '", address: "' + (address !== undefined ? address : "") + '", phone: "' + (phone !== undefined ? phone : "") + '", note: "' + (note !== undefined ? note : "") + '"}',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (results) {
            if (results === 1) {
                ////alert('OK');
                $("#input_name").val("Thanks you!").css('color', 'green');
                $('#input_email').val('');
                $('#input_phone').val('');
                $('#input_address').val('');
                $('#input_note').val('');


                $("#input_phone").attr('placeholder', 'Nhập số điện thoại');
                $("#input_phone").val(''); 
                $("#input_phone").removeClass('red'); 
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            ////alert(errorThrown + ";" + textStatus);
        }
    });
}

function getGalleryDetail(ids) {
    $.ajax({
        type: 'POST',
        url: '@Url.Action("getListImageAlbum", "gallery")',
        data: '{albumId: "' + ids + '" }',
            contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                    success: function (results) {
                        if (typeof results !== 'undefined' && results !== null) {
                            var arr_from_json = JSON.parse(results);
                            $('#resultGallery_' + ids).val(arr_from_json);
                            // Fresco.show(arr_from_json, { overflow: true, loop: true, thumbnails: 'vertical', onClick: 'close' });
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        ////alert(errorThrown + ";" + textStatus);
                    }
    });
}

function getProductImageList(ids) {
    $.ajax({
        type: 'POST',
        url: get_list_image_product,
        data: '{id: "' + ids + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (results) {
            if (typeof results !== 'undefined' && results !== null) {
                var arr_from_json = JSON.parse(results);
                Fresco.show(arr_from_json, { overflow: true, loop: true, onClick: 'close' });
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            ////alert(errorThrown + ";" + textStatus);
        }
    });
}