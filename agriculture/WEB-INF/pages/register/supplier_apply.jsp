<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="食品,溯源,追溯,系统,中国食品安全农产品溯源,中国食品安全农产品溯源,中国食品安全农产品溯源,安全农产品标准化生产溯源" />
    <meta name="Description" content="农产品溯源,中国食品安全农产品溯源,食品溯源,中国食品安全农产品溯源,食用菌溯源,中国食品安全农产品溯源,安全农产品标准化生产溯源" />
    <title>经销商申请</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/home.css" />
    
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
	<script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/public.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/jquery.blockUI.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/area.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/jquery.fileupload.js"></script>
	<script type="text/javascript" src="${ctx}/js/login.js"></script>

	<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.validate.extend.js"></script>
	
    <script type="text/javascript">
    jQuery.validator.addMethod("acount", function(value, element) {
        var expression = /^[a-zA-Z0-9_]{6,16}$/;
        return this.optional(element) || (expression.test(value));
    }, "账号只能是英文字母,_数字组成的6-16位字符串!");
    jQuery.validator.addMethod("psw", function(value, element) {
        var expression = /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,16}$/;
        return this.optional(element) || (expression.test(value));
    }, "密码是6-16个字符可以包括$&*#@字符!");
    jQuery.validator.addMethod("tel", function(value, element) {
        var expression = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
        var expression1 = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/;
        return this.optional(element) || (expression.test(value) || expression1.test(value));
    }, "联系电话格式不正确!");
    
        $(document).ready(function () {
            $('#fileUpload1').fileupload({
             	filePathId:'docfilepath',
             	validTypes:'jpg,jpeg,gif,bmp,png'
             });
            
        	var validator = $('#saveForm').validate({
        		onsubmit: false,
        		onfocusout: false,
        		onkeyup: false,
        		onclick: false,
        		showErrors : function(errorMap, errorList) {
        			if( this.errorList.length ) {
        				var error = this.errorList[0];
        				var id = error.element.id;
        				var name = error.element.name;
        				var msg = error.message;
        				art.dialog.alert(msg, function () { 
        					error.element.focus();
        				});
        				return false;
        			}
        		},
        		rules: {
        			userName: {required: true },
        			userNo: {required: true, acount: true, remote:{
        				url: "${ctx}/register/nonexistsUserName.html?registerType=2",
        				type:"post",
        				async: false,
        				data: {userName: function(){ return $("#userNo").val(); }}
        			}},
        			password: {required: true, psw: true},
        			password1: {equalTo: password},
        			supplierName: {required: true},
        			legalRepresent: {required: true},
        			regCapital: {required: true, money: true},
        			contact: {required: true},
        			tel: {required: true, mobile: true},
        			email: {required: true, email: true},
        			areaId: {required: true},
        			supplierAddress: {required: true},
        			applyRemark: {required: true},
        			checkCode: {required: true,rangelength:[4,4]},
        		},
        		messages: {
        			userName: {required: "请输入用户名!"},
        			userNo: {required: "请输入账号!", remote:"账号已存在!" },
        			password: {required: "请输入密码!" },
        			password1: {equalTo: "两次密码输入不一致!"},
        			supplierName: {required: "请输入经销商名称!"},
        			legalRepresent: {required: "请输入法定代表人!"},
        			regCapital: {required: "请输入注册资金!", money: "注册资金格式不正确!"},
        			contact: {required: "请输入联系人!"},
        			tel: {required: "请输入联系电话!"},
        			email: {required: "请输入邮箱!", email: "邮箱格式不正确!"},
        			areaId: {required: "请选择所在地区!"},
        			supplierAddress: {required: "请输入详细地址!"},
        			applyRemark: {required: "请输入申请原因!"},
        			checkCode: {required: "请输入验证码!", rangelength: "验证码不正确!"},
        		}
        	});
        	
            $('#step1Btn').click(function(){
            	if(!validator.element("#userName")) return;
				if(!validator.element("#userNo")) return;
            	if(!validator.element("#password")) return;
            	if(!validator.element("#password1")) return;
            	
            	_switch('step2');
            });
            
            $('#submitBtn').click(function(){
            	if(!validator.element("#supplierName")) return;
            	if(!validator.element("#legalRepresent")) return;
            	if(!validator.element("#regCapital")) return;
            	if(!validator.element("#contact")) return;
            	if(!validator.element("#tel")) return;
            	if(!validator.element("#email")) return;
            	if(!validator.element("#areaId")) return;
            	if(!validator.element("#supplierAddress")) return;
            	if(!validator.element("#applyRemark")) return;

                if (document.getElementById("FUMsg").innerHTML == "") {
                    art.dialog.alert("请上传您的营业执照");
                    return false;
                }
                if(!validator.element("#checkCode")) return;
                
                submitForm();
            })
        });

         function submitForm(){
        		setButtonDisabled(true);
        		openBlock();
        		
        		$.ajax({
        			type:"POST",
        			url : '<%=ApplicationUtil.getBasePath(request)%>register/saveSupplierApply.ajax',
        			data : $('#saveForm').serialize(),
        			returnType:'json',
        			success : function(jsonData) {
        				//关闭“覆盖层”
        				closeBlock();
        				//后台操作成功
        				if (jsonData.success && jsonData.success == true) {
        					window.location.href = '<%=ApplicationUtil.getBasePath(request)%>register/supplier_apply_finished.html';
        				}
        				//后台操作失败
        				else {
        					setButtonDisabled(false);
        					if(jsonData.code==1001) newCheckcode();
        					art.dialog.alert(jsonData.message);
        				}
        			},
        			error : function(XMLResponse) {
        				openDialogInDiv(XMLResponse.responseText);
        			}
        		});
        }
        function _switch(id){
        	$('table[id^="step"]').each(function(){
        		if($(this).attr('id')==id){
        			$(this).show();
        		}else{
	       			$(this).hide();
        		}
        		
        	})
        }
        var GLOBAL = {
        		WEBROOT : "${ctx}"
        	};
       var _basePath = '<%=ApplicationUtil.getBasePath(request)%>';//应用基本路径
    </script>
</head>
<body id="cbody">
    <form method="post" action="saveSupplierApply.ajax" id="saveForm">
        <div style="width: 670px; margin: 0px auto;">
            <div id="cofarmerTop" class="cofarmerTop" style="margin-top: 100px;">
                <div id="cofar_title_pic">
                    <img src="${ctx }/images/jinxiaoshang.png" />
                </div>
                <div class="cofar_title">
                    <span class="title_cn">经销商申请</span>
                    <span class="title_en">Supplier to apply for</span>
                </div>
            </div>
            <div class="cofarmerMiddle">
                <div id="regcontent" class="viewner" style="padding-left: 5px;">
                	<table  border="0" cellpadding="0" cellspacing="0" class="regbox" style="display:block;width:100%" id="step1">
                	<tr style="width:100%">
                            <td width="30%">用 户 名:</td>
                            <td width="60%">
                                <input  type="text" id="userName" name="userName" class="inw" style="width:180px;" />
                            </td>
                     </tr>
                     <tr>
                            <td>账　　号:</td>
                            <td>
                                <input name="userNo" type="text" id="userNo" class="inw" style="width:180px;" />
                            </td>
                        </tr>
                        <tr>
                            <td>密　　码:</td>
                            <td>
                                <input name="password" type="password" id="password" class="inw" style="width:180px;" />
                            </td>
                       </tr>
                       <tr>
                            <td>确认密码：</td>
                            <td>
                                <input type="password" id="password1" name="password1" class="inw" style="width: 180px" /></td>
                        </tr>
                        <tr>
                        	<td colspan="2" style="text-align: center;" align="center">
                        			<input type="button" value="下一步"  class="btntt" id="step1Btn" />
                        	</td>
                        </tr>
                	</table>
                	
                	
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regbox" style="display:none" id="step2">
                        <tr>
                            <td style="width:90px">经销商名称:</td>
                            <td>
                                <input name="supplierName" type="text" id="supplierName" class="inw" style="width:180px;" />
                            </td>
                            <td>法定代表人:</td>
                            <td>
                                <input name="legalRepresent" type="text" id="legalRepresent" class="inw" style="width:180px;" />
                            </td>
                        </tr>
                        <tr>
                            <td>注册资金(万元):</td>
                            <td>
                                <input name="regCapital" type="text" id="regCapital" class="inw" style="width:180px;" />
                            </td>
                            <td>联  系  人:</td>
                            <td>
                                <input name="contact" type="text" id="contact" class="inw" style="width:180px;" />
                            </td>
                        </tr>
                        <tr>
                            <td>联系电话:</td>
                            <td>
                                <input name="tel" type="text" id="tel" class="inw" style="width:180px;" />
                            </td>
                            <td>邮　　箱:</td>
                            <td>
                                <input name="email" type="text" id="email" class="inw" style="width:180px;" />
                            </td>
                        </tr>
                        <tr>
                            <td>所在地区:</td>
                            <td colspan="3">
					<div class="EditAreas">
							<select name="provinceAid" class="input-select"
								id="province" style="margin-right:10px;width:100px">
								<option value="">--请选择--</option>
							</select> <select name="cityAid" class="input-select" id="city"
								style="margin-right:10px;width:100px">
								<option value="">--请选择--</option>
							</select> <select name="countyAid" class="input-select"
								id="county" style="margin-right:10px;width:100px">
								<option value="">--请选择--</option>
							</select> <select name="townAid" class="input-select" id="town"
								style="margin-right:10px;width:100px">
								<option value="">--请选择--</option>
							</select>
						</div>
						<input type="hidden" id="areaId" name="areaId" />
                            </td>
                        </tr>
                        <tr>
                            <td>详细地址:</td>
                            <td colspan="3">
                                <input name="supplierAddress" type="text" id="supplierAddress" class="inw" style="width:430px;" />
                            </td>
                        </tr>
                        <tr>
                            <td>申请原因:</td>
                            <td colspan="3">
                                <input name="applyRemark" type="text" id="applyRemark" class="inw" style="width:430px;" />
                            </td>
                        </tr>
                        <tr>
                            <td>营业执照:</td>
                            <td colspan="3">
                            		<div id="fileUpload1"></div>
			                        <input type="hidden" name="docfilepath" id="docfilepath" />
                            </td>
                        </tr>

                        <tr>
                            <td>验 证 码:
                            </td>
                            <td colspan="3">
                                 <input type="text" id="checkCode" name="checkCode" placeholder="验证码" /><a href="#"><img name="checkcodeImage" src="${ctx}/checkCode/code" /> </a>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;
                            </td>
                            <td colspan="3" style="text-align: center">
                            	<input type="button" value="上一步" onclick="_switch('step1');" class="btntt" /></label>
                                <input type="button" value="提交" id="submitBtn" class="xybtn" /></label>
                            </td>
                        </tr>
                    </table>
                </div>
                
            </div>
            <div class="cofarmerBottom">
            </div>
        </div>
        <div id="divMsg" style="display: none;" name="divMsg"></div>
    </form>
</body>
</html>
    