<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.ai.common.util.WebUtils"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="/common/meta.jsp" %>
	<link href="${ctx}/css/login.css" rel="stylesheet" type="text/css">
  
	<script>
		//判断当前窗体是否有父窗体，如果有，父窗体跳转
		var parentWinObj = window;
		//获取顶级窗口
		while(true){
			if(parentWinObj.top = parentWinObj){
				break;
			}
			parentWinObj = parentWinObj.top;
		}
		
		if(parentWinObj.location.href.indexOf('loginframe/login.html')<0){
			parentWinObj.location='${ctx}/loginframe/login.html';
		}
	</script>
	<script type="text/javascript" src="${ctx}/js/login.js"></script>
   
	<title>农产品溯源管理系统</title>
</head>



<body>
<%
String username= com.ai.common.util.CookieUtil.getCookie(request,"name");
//CookieUtil.setCookie(response, Constants.COOKIS_DOMAIN, "password", password, 10);
String password= com.ai.common.util.CookieUtil.getCookie(request,"password");
if(username==null){
    username="";
}
if(password==null){
    password="";
}
String remember="";
if(!"".equals(username)&&!"".equals(password)){
    remember="checked=\"checked\"";
}
%>
<script >
function changeLogin(idx){
	$("#platform_1").removeClass("current");
	$("#platform_2").removeClass("current");
	$("#platform_10").removeClass("current");
	$("#platform_"+idx).addClass("current");
	
	$("#roleCode").val(idx);
	/* $("#div_1").css('display','none');
	$("#div_2").css('display','none'); 
	$("#div_3").css('display','none'); 
	$("#div_"+idx).css('display','block');  */
}

function remember_check(){

	$("#remember").attr("checked", !$("#remember").attr("checked"));

	remember_check1();
}
function remember_check1(){
	if($("#remember").attr("checked")=='checked'){
		$("#remember_1").hide();
		$("#remember_2").show();
	}else{
		$("#remember_1").show();
		$("#remember_2").hide();
	};
}
$(function(){
<%--	$('#username').val('yuchangbo');--%>
	//$('#username').val('jg1');
	//$('#password').val('123456');
})
</script>
<!--loginContent begin-->
<div class="wrap loginContent">
    <!--login begin-->
    
    <div class="logo"><img src="${ctx}/images/logo.gif"></div>
<!-- 
    <div class="nav">
        <div class="menu1"><a id="platform_1" href="javascript:void(0)" onclick="changeLogin(1)" class="current" ><i></i>生产者<br/>平台</a></div>
        <div class="menu2"><a id="platform_2" href="javascript:void(0)" onclick="changeLogin(2)"><i></i>经营商<br/>平台</a></div>
        <div class="menu3"><a id="platform_3" href="javascript:void(0)" onclick="changeLogin(10)"><i></i>监 管<br/>平台</a></div>
    </div> -->

    <div class="loginList">
    <input type="hidden" value="" name="roleCode" id="roleCode"/>
    
        <ul>
            <li><i class="login_icon1"></i><input type="text" class="form-control" id="username" name="username" value="<%=username %>" placeholder="用户名"  /></li>
            <li><i class="login_icon2"></i><input type="password" class="form-control" id="password" name="password" value="<%=password %>"   placeholder="密码" /></li>
            <li><i class="login_icon3"></i><input type="text" class=" w-b-50 form-control" id="checkCode" name="checkCode" placeholder="验证码"  /><a href="#"><img name="checkcodeImage" src="${ctx}/checkCode/code" /> </a> </li>
        </ul>
        <div class="SH_jiz">
             <label class="fl">
                <input type="checkbox" id="remember" <%=remember %> value="1" class="hidden"/>
                <a href="javascript:void(0)" onclick="remember_check();">
                    <div class="SH_fxk01" id="remember_1" style="display: none;"></div> 
                    <div class="SH_fxk02" id="remember_2"></div> <!-- 复选框点击状态div -->
                    <span>记住密码</span>
                </a>
            </label> 
         <!--    <a href="#" class="fr">忘记密码?</a> -->
            <div class="cl"></div>
        </div>
        <div class="btn"><button  id="submit_btn">登 录</button></div>
        <div class="prompt" id="chkMsg"></div>
    </div>
    <!--login end-->


</div>
<!--loginContent end-->


<!--copyright begin-->
<div class="wrap100 copyright">©2015 asiainfo 亚信. All rights reserved.</div>
<!--copyright end-->


</body>
</html>
<script>
remember_check1();
</script>
