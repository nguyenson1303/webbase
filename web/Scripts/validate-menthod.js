function containsAllAscii(str) {
    return /^[\040-\176]*$/.test(str);
}

function checkhtmltags(value) {
    var re_left_tags = /[<]/;
    var re_right_tags = /[>]/;
    if (!re_left_tags.test(value) && !re_right_tags.test(value)) {
        return true;
    }
    else {
        return false;
    }
}

function is_date(date_str) { ////dd/mm/yyyy
    return /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/.test(date_str);
}

function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function isNotNumeric(control) {
    if (isNaN(trimSpaces(control.value))) {
        control.focus();
        control.select();
        return true;
    }
    return false;
}

function stripHtml(value) {
    //// remove html tags and space chars
    return value.replace(/<.[^<>]*?>/g, " ").replace(/&nbsp;|&#160;/gi, " ")
    //// remove punctuation
    .replace(/[.(),;:!?%#$'\"_+=\/\-“”’]*/g, "");
}


$(document).ready(function () {

    jQuery.validator.addMethod('text_validate_default', function (value, element, params) {
        ////var placeholder = $(element).attr("placeholder");
        value = stripHtml(value);
        return (value != "" && checkhtmltags(value));
    }, "");

    jQuery.validator.addMethod('minlength', function (value, element, params) {
        ////var placeholder = $(element).attr("placeholder");
        return (value != "" && value.length > (parseInt(params) - 1));
    }, "");

    jQuery.validator.addMethod('select_default_int', function (value) {
        return (value != "0");
    }, "");

    jQuery.validator.addMethod('containsAllAscii', function (value) {
        return containsAllAscii(value);
    }, "");

    jQuery.validator.addMethod('select_default_string', function (value) {
        ////console.log(" value ", value);
        if (value != "00" && value !== "00" && value != "")
            return true
        return false;
    }, "");

    jQuery.validator.addMethod('datetimepicker_default_value', function (value, element, params) {
        ////var placeholder = $(element).attr("placeholder");
        return (value != "" && value != "0/0/0" && value != "00/00/0000" && value != "dd/mm/yyyy");
    }, "");

    jQuery.validator.addMethod('radio_checked', function (value, element, params) {
        var obj = $('input[name="' + params + '"]:checked').val();
        return (typeof obj != 'undefined' && typeof obj != null && typeof obj !== "");
    }, "");

    jQuery.validator.addMethod('default_value_space', function (value) {
        return (value.indexOf(' ') == -1);
    }, "");

    jQuery.validator.addMethod('checkNameValidate', function (value) {
        var re_name = /[^a-zA-Z\s]/g
        return !re_name.test(value);
    }, "");

    jQuery.validator.addMethod('checkAddressValidate', function (value) {
        var re_add = /^[a-zA-Z0-9- &();.,:\\'"]*$/
        return re_add.test(value);
    }, "");

    jQuery.validator.addMethod('checkNumberValidate', function (value) {
        return (!isNaN(value));
    }, "");

    jQuery.validator.addMethod('check_regularPhoneNumber', function (value) {
        if (value != "") {
            var re_name = /^[\(+]?([0-9]{1,3})\)?[-. ]?([0-9]{3})\)?[-. ]?([0-9]{3,4})[-. ]?([0-9]{0,4})[-. ]?([0-9]{0,4})$/
            return re_name.test(value);
        }
        else
            return true;
    }, "");

    jQuery.validator.addMethod('check_validation_datetime', function (value) {
        ////var re_name = "/^(0[1-9]|[12][0-9]|3[01])[/](0[1-9]|1[012])[/](19|20)\d\d$/";	
        ////				return re_name.test(value);
        return is_date(value);
    }, "");

    jQuery.validator.addMethod('check_html_tags', function (value) {
        var re_left_tags = /[<]/;
        var re_right_tags = /[>]/;
        return (!re_left_tags.test(value) || !re_right_tags.test(value));
    }, "");

    jQuery.validator.addMethod('datetimepicker_large_today', function (value) {
        var today = new Date();
        var date_value = value.split("/");
        var d = new Date(date_value[2], date_value[1] - 1, date_value[0]);
        return (d.getTime() > today.getTime());
    }, "");

    jQuery.validator.addMethod('datetimepicker_large_today_new', function (value, element, params) {
        var today = new Date();

        var day = parseInt($('#' + params[0]).val());
        var month = parseInt($('#' + params[1]).val());
        var year = parseInt($('#' + params[2]).val());
        if (day > 0 && month > 0 && year > 0) {
            var d = new Date(year, month - 1, day);
            return (d.getTime() > today.getTime());
        }
    }, "");

    jQuery.validator.addMethod('datetimepicker_less_today', function (value) {
        var today = new Date();
        var date_value = value.split("/");
        var d = new Date(date_value[2], date_value[1] - 1, date_value[0]);
        return (d.getTime() < today.getTime());
    }, "");

    jQuery.validator.addMethod('datetimepicker_less_today_new', function (value, element, params) {
        var today = new Date();
        var day = parseInt($('#' + params[0]).val());
        var month = parseInt($('#' + params[1]).val());
        var year = parseInt($('#' + params[2]).val());
        if (day > 0 && month > 0 && year > 0) {
            var d = new Date(year, month - 1, day);
            return (d.getTime() < today.getTime());
        }
    }, "");

    jQuery.validator.addMethod("notEqualTo", function (value, element, param) {
        var notEqual = true;
        value = $.trim(value);
        for (i = 0; i < param.length; i++) {
            if (value == $.trim($(param[i]).val())) { notEqual = false; }
        }
        return this.optional(element) || notEqual;
    }, "");


    jQuery.validator.addMethod('default_value_card_expirydate', function (value) {
        var today = new Date();
        var exDay = today.getDate();
        var exMonth = parseInt($('#cc_mm').val());
        var exYear = parseInt($('#cc_yy').val());
        if (exMonth > 0 && exYear > 0) {
            var d = new Date(exYear + 2000, exMonth, exDay);
            return (d.getTime() > today.getTime());
        }
        else
            return (value !== 0)
    }, "");

    jQuery.validator.addMethod("maxWords", function (value, element, params) {
        return this.optional(element) || stripHtml(value).match(/\b\w+\b/g).length <= params;
    }, jQuery.validator.format("Please enter {0} words or less."));

    jQuery.validator.addMethod("minWords", function (value, element, params) {
        return this.optional(element) || stripHtml(value).match(/\b\w+\b/g).length >= params;
    }, jQuery.validator.format("Please enter at least {0} words."));

    jQuery.validator.addMethod("rangeWords", function (value, element, params) {
        var valueStripped = stripHtml(value),
			regex = /\b\w+\b/g;
        return this.optional(element) || valueStripped.match(regex).length >= params[0] && valueStripped.match(regex).length <= params[1];
    }, jQuery.validator.format("Please enter between {0} and {1} words."));

});



$(document).ready(function (e) {
    $.validator.setDefaults({
        submitHandler: function () {
            Rating_product();
            valid_order_form();
        }
    });

    function valid_order_form() {
        //// validate signup form on keyup and submit
        $("#order_register_form").validate({
            errorElement: 'span',
            errorPlacement: function (error, element, value) {
                error.appendTo(element.parent('div:first'));
                element.parents('div:first').addClass("error");
            },
            rules: {
                name: {
                    text_validate_default: true//,
                    ////checkNameValidate: true
                },
                email: {
                    text_validate_default: true,
                    email: true
                },
                phone: {
                    text_validate_default: true
                },
                code: {
                    text_validate_default: true
                },
                address: {
                    text_validate_default: true
                }

            },
            messages: {
                name: {
                    text_validate_default: ""//,
                    ////checkNameValidate: "Please use only standard characters (a-z) in your Name"
                },
                email: {
                    text_validate_default: "",
                    email: "Your Email Address seems incorrect.\nPlease make sure the formatting is correct (@ and .)"
                },
                phone: {
                    text_validate_default: ""
                },
                code: {
                    text_validate_default: ""
                },
                address: {
                    text_validate_default: ""
                }

            }
        });
    }

    $().ready(function () {

        //// validate signup form on keyup and submit
        $("#contact_register_form").validate({
            errorElement: 'span',
            errorPlacement: function (error, element, value) {
                error.appendTo(element.parent('div:first'));
                element.parents('div:first').addClass("error");
            },
            rules: {
                name: {
                    text_validate_default: true//,
                    ////checkNameValidate: true
                },
                email: {
                    text_validate_default: true,
                    email: true
                },
                phone: {
                    text_validate_default: true
                },
                address:{
                    text_validate_default: true
                },
                contents: {
                    text_validate_default: true
                },
                code: {
                    text_validate_default: true
                }               
            },
            messages: {
                name: {
                    text_validate_default: ""//,
                    ////checkNameValidate: "Please use only standard characters (a-z) in your Name"
                },
                email: {
                    text_validate_default: "",
                    email: "Your Email Address seems incorrect.\nPlease make sure the formatting is correct (@ and .)"
                },
                phone: {
                    text_validate_default: ""
                },
                address: {
                    text_validate_default: ""
                },
                contents: {
                    text_validate_default: ""
                },
                code: {
                    text_validate_default: ""
                }
            }
        });

        //// validate signup form on keyup and submit
        $("#rating_form").validate({
            errorElement: 'span',
            errorPlacement: function (error, element, value) {
                error.appendTo(element.parent('div:first'));
                element.parents('div:first').addClass("error");
            },
            rules: {
                inputName: {
                    text_validate_default: true//,
                    ////checkNameValidate: true
                },
                inputEmail: {
                    text_validate_default: true,
                    email: true
                },
                inputContents: {
                    text_validate_default: true
                },
                captcha_text: {
                    text_validate_default: true
                }
               
            },
            messages: {
                inputName: {
                    text_validate_default: ""//,
                    ////checkNameValidate: "Please use only standard characters (a-z) in your Name"
                },
                inputEmail: {
                    text_validate_default: "",
                    email: "Your Email Address seems incorrect.\nPlease make sure the formatting is correct (@ and .)"
                },
                inputContents: {
                    text_validate_default: ""
                },
                captcha_text: {
                    text_validate_default: ""
                }
                
            }
        });

        valid_order_form();

        //// validate signup form on keyup and submit
        $("#register_form").validate({
            errorElement: 'span',
            errorPlacement: function (error, element, value) {
                error.appendTo(element.parent('div:first'));
                element.parents('div:first').addClass("error");
            },
            rules: {
                fname: {
                    text_validate_default: true,
                    minlength: 3,
                    maxlength: 50//,
                    ////checkNameValidate: true
                },
                email: {
                    text_validate_default: true,
                    email: true
                },
                password: {
                    text_validate_default: true,
                    minlength: 5,
                    maxlength: 10
                },
                confirm_password: {
                    text_validate_default: true,
                    minlength: 5,
                    maxlength: 10,
                    equalTo: "#password"
                },
                code: {
                    text_validate_default: true
                }
            },
            messages: {
                fname: {
                    text_validate_default: "",
                    minlength: "Your name must be at least 3 characters long",
                    maxlength: "Your name must be at small than 50 characters long"//,
                    ////checkNameValidate: "Please use only standard characters (a-z) in your Name"
                },
                email: {
                    text_validate_default: "",
                    email: "Your Email Address seems incorrect.\nPlease make sure the formatting is correct (@ and .)"
                },
                password: {
                    text_validate_default: "",
                    minlength: "Your password must be at least 5 characters long",
                    maxlength: "Your password must be at small than 10 characters long"
                },
                confirm_password: {
                    text_validate_default: "",
                    minlength: "Your password must be at least 5 characters long",
                    maxlength: "Your password must be at small than 10 characters long",
                    equalTo: "Please enter the same password as above"
                },
                code: {
                    text_validate_default: ""
                }

            }
        });

        

    });
});

