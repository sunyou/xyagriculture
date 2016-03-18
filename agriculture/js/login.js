$(function () {
	
    //登陆
    $("#submit_btn").click(function () {
        login();
    });
    
    //重置
    $("#reset_btn").click(function(){
    	cleanAll();
    });

	//图片验证码切换
	$("[name='checkcodeImage']").click(function(){
		newCheckcode();
	});
});

//解决ie下不支持placeholder（占位符）问题
function placeholder() {
	var doc = document, inputs = doc.getElementsByTagName('input'),
	supportPlaceholder = 'placeholder' in doc.createElement('input'), placeholder = function(input) {
		var text = input.getAttribute('placeholder'), defaultValue = input.defaultValue;
		if (defaultValue == '') {
			input.value = text;
		}
		input.onfocus = function() {
			if (input.value === text) {
				this.value = '';
			}
		};
		input.onblur = function() {
			if (input.value === '') {
				this.value = text;
			}
		};
	};
	if (!supportPlaceholder) {
		for ( var i = 0, len = inputs.length; i < len; i++) {
			var input = inputs[i], text = input.getAttribute('placeholder');
			if (input.type === 'text' && text) {
				placeholder(input);
			}
		}
	}
}

//用户登陆验证
function login() {
	var username = $.trim($("#username").val());//用户名
	var password = $.trim($("#password").val());//密码
	var checkCode = $("#checkCode").val();//随机码
	//用户名为空
	if(username==""){
        $("#chkMsg").html('<i class="prompt_icon"></i>请输入用户名！');
        $("#username").focus();
        return false;
  	}
	//密码为空
	if(password==""){
	   $("#chkMsg").html('<i class="prompt_icon"></i>请输入密码！');
	   $("#password").focus();
	   return false;
	}

//	alert( $("#checkcode"));
	if(checkCode == undefined || checkCode.length != 4){
		$("#chkMsg").html('<i class="prompt_icon"></i>随机码不正确，请重新输入！');
		 $("#checkcode").focus();
		newCheckcode();
        return false;
	}
	

	$("#chkMsg").html("<img src='"+GLOBAL.WEBROOT+"/content/js/LigerUI/images/loading.gif' style='width:16px;height:16px'>校验中,请稍候..");
	//$("#login").attr("disabled",true);
	$("#submit").attr("disabled",true);
	$("#reset").attr("disabled",true);
	$.ajax({
		type: "POST",
		dataType : 'json',
		url: GLOBAL.WEBROOT+'/login/doLogin',  
		data: {"name":username,"password":password,"checkCode":checkCode},
		success: function(data){
			loginBack(data.resultCode,data.resultMessage);
		},
		error: function(data){
   			alert("请求超时，请稍候再试!");
   			//$("#login").attr("disabled",false);
   			$("#submit_btn").attr("disabled",false);
   			//$("#reset").attr("disabled",false);
		}
	});

}

//切换随机码
function newCheckcode(){
	$("#checkcode").val('');
	var url = $("[name='checkcodeImage']").attr("src");
		if(url.indexOf("?") != -1){
			$("[name='checkcodeImage']").attr("src",$("[name='checkcodeImage']").attr("src") + "&nocache=" + new Date().getTime());
		}else{
			$("[name='checkcodeImage']").attr("src",$("[name='checkcodeImage']").attr("src") + "?nocache=" + new Date().getTime());
		}
}

//验证图片随机码
function verifyCode(){
	var checkCode = $("#checkcode").val();//随机码
    if(checkCode == undefined || checkCode.length != 4){
        return false;
    }
    var checkCodeFlag = false;
   
    $.ajax({
        type: "POST",
        async: false,
        url:GLOBAL.WEBROOT+'/checkCode/codeValidate.ajax',
        data: {checkCode:checkCode},
        dataType:'json',
        success:function(data){
            if(data.result){
                checkCodeFlag = true;
            }
        }
    });
    return checkCodeFlag;
}

//操作成功后返回值的操作
function loginBack(code,message) {
    switch (code) {
        case "-1" :
        {
        	$("#chkMsg").html('<i class="prompt_icon"></i>'+message);
            break;
   			$("#submit").attr("disabled",false);
   			$("#reset").attr("disabled",false);
        }case "-2" :
        {
        	$("#chkMsg").html('<i class="prompt_icon"></i>'+message);
            break;
   			$("#submit").attr("disabled",false);
   			$("#reset").attr("disabled",false);
        }case "-3" :
        {
        	$("#chkMsg").html('<i class="prompt_icon"></i>'+message);
            break;
   			$("#submit").attr("disabled",false);
   			$("#reset").attr("disabled",false);
        }case "-4" :
        {
        	$("#chkMsg").html('<i class="prompt_icon"></i>'+message);
            break;
   			$("#submit").attr("disabled",false);
   			$("#reset").attr("disabled",false);
        }case "-5" :
        {
        	$("#chkMsg").html('<i class="prompt_icon"></i>'+message);
            break;
   			$("#submit").attr("disabled",false);
   			$("#reset").attr("disabled",false);
        }case "-9" :
        {
        	$("#chkMsg").html('<i class="prompt_icon"></i>'+message);
            break;
   			$("#submit").attr("disabled",false);
   			$("#reset").attr("disabled",false);
        }
        case "0" :
        {
            //window.top.location = "main.jsp";
        	window.top.location = GLOBAL.WEBROOT+"/loginframe/index.html";
            break;
        }
        /*case "1" :
        {
        	$("#chkMsg").html('<i class="prompt_icon"></i>该用户不存在！');
   			$("#submit").attr("disabled",false);
   			$("#reset").attr("disabled",false);
            break;
        }
        case "2" :
        {
        	$("#chkMsg").html('<i class="prompt_icon"></i>用户名或密码错误！');
   			$("#submit").attr("disabled",false);
   			$("#reset").attr("disabled",false);
            break;
        }*/
        default :
        {
        	$("#chkMsg").html('<i class="prompt_icon"></i>系统忙,请稍候再试！');
   			$("#submit").attr("disabled",false);
   			$("#reset").attr("disabled",false);
        }
    }
    newCheckcode();
}

//回车键盘监听事件
document.onkeydown = keyListener;
function keyListener(e) {
    e = e ? e : event;
    if (e.keyCode == 13) {
        login();
    }
}

//重填
function cleanAll() {
    $("#username").val("");
    $("#password").val("");
    newCheckcode();
 }