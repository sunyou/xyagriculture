/**
*扩展验证框
*author:叶明龙
*/
$(document).ready(function() {
    //两个值是否相等
    $.extend($.fn.validatebox.defaults.rules, {
        /*必须和某个字段相等*/
        equalTo: {
            validator: function(value, param) {
                return $(param[0]).val() == value;
            },
            message: '字段不匹配'
        }

    });
    //用户名
    $.extend($.fn.validatebox.defaults.rules, {
        /*用户名*/
        userAccount: {
            validator: function(value) {
                var rel = /^[a-zA-z][a-zA-Z0-9_]{2,16}$/
                return rel.test(value);
            },
            message: '帐号格式以字母开头,允许字母数字下划线3-16个字节'
        }

    });
    //验证码
    $.extend($.fn.validatebox.defaults.rules, {
        vcookiecode: {
            validator: function(value, param) {
                return value.toLowerCase() == $.cookie(param[0]);
            },
            message: '{1}输入不正确'
        }
    });

})