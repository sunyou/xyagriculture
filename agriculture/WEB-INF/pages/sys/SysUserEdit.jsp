<%@ page contentType="text/html;charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/common/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户编辑/新增</title>
<%@ include file="/common/meta.jsp" %>
<script type="text/javascript">
        $(document).ready(function () {
            $("#saveForm").validate({
				 onfocusout : false,
				 showErrors : function(errorMap, errorList) {
				   var msg = "";  
				 $.each(errorList, function(i, v) { 
				  msg += (v.message + "\r\n");   });
				  if (msg != "")  alert(msg);   
				}, 
                errorPlacement: function (error, element) {
                },
                rules: {
                	userNo: "required",
                	userName: "required"
                },

                messages: {
                	userNo: "请填写账号",
                	userName: "请填写姓名"
                },
                submitHandler : function() {
                	var province = $("#province").val();//密码
                	var operatorCode = $("#txt_User_No").val();
        			//用户名密码验证
        			if(province==""){
        	            alert("请选择区域属性!");
        	            $("#province").focus();
        	            return;
            	  	}
                	
        			//if ("" == operatorCode || operatorCode.indexOf(" ") > -1 || !checkOperCode(operatorCode)) {
        				//alert("工号输入有误,请重新输入！工号可以由字母、数字、下划线组成，长度为3-16位！");
        				//$("#txt_User_No").focus();
        				//return;
        			//} 
                	
					ajaxSubmitForm($("#saveForm"), ajaxSubmitFormDefCallback);
				}
            });
	
        });
        
        function checkOperCode(operatorCode){ 
        	var reg=/^[a-zA-Z0-9_]{3,16}$/; 
        	if(reg.test(operatorCode)){
        		return true;
        	}else {
        		return false;
        	}	
        }
</script>
</head>
<body>
	<form method="post" action="sysmanage/sysUserSave.ajax" id="saveForm">
		<input type="hidden" id="optType" name="optType" value="${optType}" />
			<input type="hidden" id="userId" name="usersid" value="${bean.userId}" />
			<input type="hidden" id="areaId" name="areaId" value="${bean.areaId}" />
		<%--<input type="hidden" id="provinceValue" name="provinceAids" value="${bean.provinceAid}" /> 
		<input type="hidden" id="cityValue" name="cityAids" value="${bean.cityAid}" />
		<input type="hidden" id="countyValue" name="countyAids" value="${bean.countyAid}" /> 
		<input type="hidden" id="townValue" name="townAids" value="${bean.townAid}" />
		--%><div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0"
				cellspacing="0">

				<tr>
					<td>
						<div>类型:</div>
					</td>
					<td><asia:select id="txt_UserType" name="usertypeId"
							dictId="SYS_USER_TYPE" nullOption="false" nullText="请选择"
							defaultValue="${bean.usertypeId}"></asia:select></td>
				</tr>
				<tr>
					<td>
						<div>账号:</div>
					</td>
					<td><c:choose>
							<c:when test="${optType!='1'}">
								<input name="userNo" type="hidden" id="txt_User_No" class="inw"
									value="${bean.userNo}" />
								<span>${bean.userNo}</span>
							</c:when>
							<c:otherwise>
								<input name="userNo" type="text" id="txt_User_No" class="inw"
									value="${bean.userNo}" />
							</c:otherwise>
						</c:choose></td>

				</tr>
				<tr>
					<td>
						<div>姓名:</div>
					</td>
					<td><input name="userName" type="text" id="txt_User_Name"
						class="inw" value="${bean.userName}" />
					</td>

				</tr>
				<tr>
					<td>
						<div>电话:</div>
					</td>
					<td><input name="tel" type="text" id="txt_Mobile" class="inw"
						value="${bean.tel}" />
					</td>

				</tr>
				<tr>
					<td>
						<div>邮箱:</div>
					</td>
					<td><input name="email" type="text" id="txt_Email" class="inw"
						value="${bean.email}" />
					</td>

				</tr>
				<tr>
					<td>
						<div>所属地区:</div>
					</td>
					<td>
						<div class="EditAreas">
							<select name="provinceAid" class="input-select"
								id="province" style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> <select name="cityAid" class="input-select" id="city"
								style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> <select name="countyAid" class="input-select"
								id="county" style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> <select name="townAid" class="input-select" id="town"
								style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select>
						</div>
					</td>

				</tr>

			</table>
			<div align=center><br><br>
			<c:if test="${optType!='3'}">
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			   </c:if>
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
		</div>
	</form>
</body>
</html>

