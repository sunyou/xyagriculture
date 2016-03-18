/**
 * songxiaoliang
 * 
 * 覆盖validator原有的错误提示方式
 */
jQuery.validator.prototype.defaultShowErrors = function() {
		//update start
		if(!TopErrorMessage.hasInit()){
			TopErrorMessage.init();
		}
		//TopErrorMessage.clear();
		//update end
		for ( var i = 0; this.errorList[i]; i++ ) {
			var error = this.errorList[i];
			this.settings.highlight && this.settings.highlight.call( this, error.element, this.settings.errorClass, this.settings.validClass );
			
			//update start
//			this.showLabel( error.element, error.message );
			var id = error.element.id;
			var name = error.element.name;
			var msg = error.message;
			TopErrorMessage.addError(name, msg);
			//update end
		}
		if( this.errorList.length ) {
			this.toShow = this.toShow.add( this.containers );
		}
		if (this.settings.success) {
			for ( var i = 0; this.successList[i]; i++ ) {
				this.showLabel( this.successList[i] );
			}
		}
		if (this.settings.unhighlight) {
			for ( var i = 0, elements = this.validElements(); elements[i]; i++ ) {
				this.settings.unhighlight.call( this, elements[i], this.settings.errorClass, this.settings.validClass );
				//update start
				TopErrorMessage.removeError(elements[i].name);
				//update end
			}
		}
		this.toHide = this.toHide.not( this.toShow );
		this.hideErrors();
		this.addWrapper( this.toShow ).show();
		//update start
		if(TopErrorMessage.haveError()){
			TopErrorMessage.show();
		}
		else{
			TopErrorMessage.hide();
		}
		//update end
};

/**
 * 验证规则扩展
 */
// 金额:  大于等于零，小于等于99999999.99 的数字
jQuery.validator.addMethod("money", function(value, element) {
    var exp =  /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
    return this.optional(element) || (exp.test(value));
}, "'手机号码'格式错误");   
// 手机号码验证
jQuery.validator.addMethod("mobile", function(value, element) {
	var length = value.length;
	var mobile =  /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
		return this.optional(element) || (length == 11 && mobile.test(value));
}, "'手机号码'格式错误");   

// 电话号码验证   
jQuery.validator.addMethod("phone", function(value, element) {
    var tel = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/;
    return this.optional(element) || (tel.test(value));
}, "'电话号码'格式错误");

// 邮政编码验证   
jQuery.validator.addMethod("zipCode", function(value, element) {
    var tel = /^[0-9]{6}$/;
    return this.optional(element) || (tel.test(value));
}, "'邮政编码'格式错误");

// QQ号码验证   
jQuery.validator.addMethod("qq", function(value, element) {
    var tel = /^[1-9]\d{4,9}$/;
    return this.optional(element) || (tel.test(value));
}, "'QQ号码'格式错误");

// IP地址验证
jQuery.validator.addMethod("ip", function(value, element) {
    var ip = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
    return this.optional(element) || (ip.test(value) && (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256 && RegExp.$4 < 256));
}, "'IP地址'格式错误");

// 字母或数字的验证
jQuery.validator.addMethod("chrnum", function(value, element) {
    var chrnum = /^([a-zA-Z0-9]+)$/;
    return this.optional(element) || (chrnum.test(value));
}, "只能输入数字或字母(字符A-Z, a-z, 0-9)");

// 必须且仅包含数字和字母验证
jQuery.validator.addMethod("onlyChrAndNum", function(value, element) {
    var onlyChrAndNum = /^(\d+[a-zA-Z][\da-zA-Z]*|[a-zA-Z]+\d[\da-zA-Z]*)$/;
    return this.optional(element) || (onlyChrAndNum.test(value));
}, "必须且仅包含数字和字母(字符A-Z, a-z, 0-9)");

// 必须且仅包含数字和字母验证
jQuery.validator.addMethod("chrAndNum", function(value, element) {
    var chrAndNum = /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;
    return this.optional(element) || (chrAndNum.test(value));
}, "必须包含数字和字母(字符A-Z, a-z, 0-9)");

// 中文的验证
jQuery.validator.addMethod("chinese", function(value, element) {
    var chinese = /^[\u4e00-\u9fa5]+$/;
    return this.optional(element) || (chinese.test(value));
}, "只能输入中文");

// 下拉框验证
$.validator.addMethod("selectNone", function(value, element) {
    return value == "请选择";
}, "必须选择一项");

// 字节长度验证
jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {
    var length = value.length;
    for (var i = 0; i < value.length; i++) {
        if (value.charCodeAt(i) > 127) {
            length++;
        }
    }
    return this.optional(element) || (length >= param[0] && length <= param[1]);
}, $.validator.format("请确保输入的值在{0}-{1}个字节之间(一个中文字算2个字节)")); 
//验证身份证号码
jQuery.validator.addMethod("idCardNo", function (value, element) {
    //验证身份证号方法 
    var testIdCardNo = function (idcard) {
        var Errors = new Array("验证通过!", "身份证号码位数不对!", "身份证号码出生日期超出范围或含有非法字符!", "身份证号码校验错误!", "身份证地区非法!");
        var area = { 11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古", 21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏", 33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南", 42: "湖北", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆", 51: "四川", 52: "贵州", 53: "云南", 54: "西藏", 61: "陕西", 62: "甘肃", 63: "青海", 64: "宁夏", 65: "xinjiang", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外" }
        var idcard, Y, JYM;
        var S, M;
        var idcard_array = new Array();
        idcard_array = idcard.split("");
        if (area[parseInt(idcard.substr(0, 2))] == null) return Errors[4];
        switch (idcard.length) {
            case 15:
                if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0 || ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0)) {
                    ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/; //测试出生日期的合法性 
                }
                else {
                    ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/; //测试出生日期的合法性 
                }
                if (ereg.test(idcard))
                    return Errors[0];
                else
                    return Errors[2];
                break;
            case 18:
                if (parseInt(idcard.substr(6, 4)) % 4 == 0 || (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard.substr(6, 4)) % 4 == 0)) {
                    ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/; //闰年出生日期的合法性正则表达式 
                }
                else {
                    ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/; //平年出生日期的合法性正则表达式 
                }
                if (ereg.test(idcard)) {
                    S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 + parseInt(idcard_array[7]) * 1 + parseInt(idcard_array[8]) * 6 + parseInt(idcard_array[9]) * 3;
                    Y = S % 11;
                    M = "F";
                    JYM = "10X98765432";
                    M = JYM.substr(Y, 1);
                    if (M == idcard_array[17])
                        return Errors[0];
                    else
                        return Errors[3];
                }
                else
                    return Errors[2];
                break;
            default:
                return Errors[1];
                break;
        }
    };
    return testIdCardNo(value) == '验证通过!';
}, jQuery.validator.format("'身份证'格式错误!"));
