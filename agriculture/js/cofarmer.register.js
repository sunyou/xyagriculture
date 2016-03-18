/**
*=========================================================
*author：叶明龙
*QQ：286538495
*email:18591978263@126.com
*description：生产者注册
*createTime：2013/04/19
*=========================================================
*/

function updatePoint(point){
	//alert(point.lng+";"+point.lat+";"+point.zoom);
	$("#lng").val(point.lng);
	$("#lat").val(point.lat);
	$("#zoom").val(point.zoom);
}
/** 百度地图定位 **/
function openMap() {
    if ($("#lng").val() == undefined || $("#lng").val() == '' 
    	|| $("#lat").val() == undefined || $("#lat").val() == '' 
    	|| $("#zoom").val() == undefined || $("#zoom").val() == '') {
    	
        var _add = $("#provice").find("option:selected").text() + $("#city").find("option:selected").text() + $("#county").find("option:selected").text() + $("#town").find("option:selected").text();
        var url = _basePath+'/Map/bmap.html?t=1&ad=' + _add + "&name=" + $("#txt_CoFarmer_Name").val();
        art.dialog.open(url, { title: '在地图上找到我', width: '100%', height: '100%' });
    } else {
        //alert("/pages/map/bmap.aspx?t=1&p=" + $("#lng").val() + "|" + $("#lat").val() + "|" + $("#zoom").val());
        //return false;
        var url = "/pages/map/bmap.aspx?t=1&p=" + $("#lng").val() + "|" + $("#lat").val() + "|" + $("#zoom").val()+ "|" + $("#txt_CoFarmer_Name").val();
        //alert(url);
        art.dialog.open(url, { title: '在地图上找到我', width: '100%', height: '100%' });
    }
}
/** 百度地图定位-new **/
function openBdmap() {
    if ($("#lng").val() == undefined || $("#lng").val() == '' 
    	|| $("#lat").val() == undefined || $("#lat").val() == '' 
    	|| $("#zoom").val() == undefined || $("#zoom").val() == '') {
    	
        var address = $("#provice").find("option:selected").text() + $("#city").find("option:selected").text() + $("#county").find("option:selected").text() + $("#town").find("option:selected").text();
        var name = $("#txt_CoFarmer_Name").val();
        name = escape(name).replace(/%u/g,'\\u');
        address = escape(address).replace(/%u/g,'\\u');
        var url = _basePath+'/Map/bdmap.html?address='+address+"&name="+name+"&edit=true";
        art.dialog.open(url, { title: '在地图上找到我', width: '100%', height: '100%' });
    } else {
    	var lng = $("#lng").val();	//经度
		var lat = $("#lat").val();	//纬度
		var zoom = $("#zoom").val();
		var name = $("#txt_CoFarmer_Name").val();
		name = escape(name).replace(/%u/g,'\\u');
        var url = _basePath+'/Map/bdmap.html?name='+name+'&lng='+lng+'&lat='+lat+'&zoom='+zoom+"&edit=true";
        art.dialog.open(url, { title: '在地图上找到我', width: '100%', height: '100%' });
    }
}


var step = ["tb_01", "tb_02", "tb_03"]
function toStep(t) {
   /* if (t == step[1]) {
        document.getElementById("cofarmerTop").style.marginTop = "";
    } else document.getElementById("cofarmerTop").style.marginTop = "100px";
*/
    for (var n in step) {
        var _div = document.getElementById(step[n]);
        if (step[n] == t) {
            _div.style.display = "";
        } else {
            _div.style.display = "none";

        }
    }
}


function CheckUser(fn) {
	ajaxSubmit(_basePath+"/register/existsUserName.ajax?registerType=1", 
				{userName: $("#txt_UserNo").val()}, 
				function(data){
					if (!data.success) {
		            	art.dialog.alert("用户名已经存在! ");
		            	$("#txt_UserNo").focus();
		            	return false;
			        }
			        else{
			        	fn.call(this, data);
			        }
				})

}






function CheckFrom(t) {
    var emailReg = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,
        userReg = /^[a-zA-Z0-9_]{6,16}$/,
        pwdReg = /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,16}$/,
        numReg = /^[0-9]{1,20}$/,
        mobileReg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/,
		telReg = /^\d{3,4}-?\d{7,9}$/;;
    var objForm = document.getElementById("saveForm");
    if (step[0] == t) {
        if (objForm.txt_UserNo.value == "") {
            art.dialog.alert("请填写用户名", function () { objForm.txt_UserNo.focus(); });
            return false;
        }
        if (!userReg.test(objForm.txt_UserNo.value)) {
            art.dialog.alert("用户名只能是英文字母,_数字组成的6-16位字符串", function () { objForm.txt_UserNo.focus(); });
            return false;
        }
        if (objForm.txt_pwd.value == "") {
            art.dialog.alert("请填写密码", function () { objForm.txt_pwd.focus(); });
            return false;
        }
        if (!pwdReg.test(objForm.txt_pwd.value)) {
            art.dialog.alert("密码是6-16个字符可以包括$&*#@字符", function () { objForm.txt_pwd.focus(); });
            return false;
        }
        if (objForm.txt_pwd2.value == "") {
            art.dialog.alert("请填写确认密码", function () { objForm.txt_pwd2.focus(); });
            return false;
        }
        if (objForm.txt_pwd2.value != objForm.txt_pwd.value) {
            art.dialog.alert("两次密码输入不一致", function () { objForm.txt_pwd.focus(); });
            return false;
        }
        //检查用户
        CheckUser(function () {
            toStep(step[1]);
        });

    } else if (step[1] == t) {

        if (objForm.txt_CoFarmer_Name.value == "") {
            art.dialog.alert("请填写生产者名称", function () { objForm.txt_CoFarmer_Name.focus(); });
            return false;
        }
        if (objForm.txt_Legal_Represent.value == "") {
            art.dialog.alert("请填写法人", function () { objForm.txt_Legal_Represent.focus(); });
            return false;
        }
        if (objForm.txt_RecordDate.value == "") {
            art.dialog.alert("请填写成立日期", function () { objForm.txt_RecordDate.focus(); });
            return false;
        }
        if (objForm.txt_RegCapital.value == "") {
            art.dialog.alert("请填写注册资金", function () { objForm.txt_RegCapital.focus(); });
            return false;
        }
        if (!numReg.test(objForm.txt_RegCapital.value)) {
            art.dialog.alert("注册资金请填写数字", function () { objForm.txt_UserNo.focus(); });
            return false;
        }
        if (objForm.txt_Tel.value == "") {
            art.dialog.alert("请填写联系电话", function () { objForm.txt_Tel.focus(); });
            return false;
        }
        if (!(mobileReg.test(objForm.txt_Tel.value) || telReg.test(objForm.txt_Tel.value))) {
            art.dialog.alert("联系电话必须是手机号码133xxxxxxxx或者是固定电话021-xxxxxxxx", function () { objForm.txt_Tel.focus(); });
            return false;
        }
        if (objForm.txt_Fax.value == "") {
            art.dialog.alert("请填写传真", function () { objForm.txt_Fax.focus(); });
            return false;
        }
        if (objForm.txt_Email.value == "") {
            art.dialog.alert("请填写邮箱", function () { objForm.txt_Email.focus(); });
            return false;
        }
        if (!emailReg.test(objForm.txt_Email.value)) {
            art.dialog.alert("邮箱格式有误", function () { objForm.txt_Email.focus(); });
            return false;
        }
        if (objForm.town.value == "") {
            art.dialog.alert("请选择所在区域");
            return false;
        }
        if (objForm.txt_DetailAddr.value == "") {
            art.dialog.alert("请填写您的地址", function () { objForm.txt_DetailAddr.focus(); });
            return false;
        }
        if (objForm.txt_ProCategory.value == "") {
            art.dialog.alert("请填写您的产品", function () { objForm.txt_ProCategory.focus(); });
            return false;
        }
        toStep(step[2]);
    } else {

        if (document.getElementById("FUMsg").innerHTML == "") {
            art.dialog.alert("请上传您的营业执照");
            return false;
        }
        if (objForm.lng.value == "") {
        	art.dialog.alert("请定位您的位置", function () { openBdmap(); });
        	return false;
        }
        if (objForm.checkCode.value == "") {
            art.dialog.alert("请填写验证码", function () { objForm.checkCode.focus(); });
            return false;
        }
        if ($("#checkCode").val().length != 4) {
            art.dialog.alert("验证码填写错误", function () { objForm.checkCode.focus(); });
            return false;
        }
        return true;
    }

}

