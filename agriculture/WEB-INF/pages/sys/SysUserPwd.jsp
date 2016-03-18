<%@ page contentType="text/html;charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/common/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户密码修改</title>
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
                	oldPsw: "required",
                	newPsw: "required"
                },

                messages: {
                	oldPsw: "请填写旧密码",
                	newPsw: "请填写新密码"
                },
                submitHandler : function() {
					ajaxSubmitForm($("#saveForm"), closeDialogInDivF);
				}
            });
	
        });
        
        
</script>
</head>
<body>
	<form method="post" action="sysmanage/sysUserPwdChange.ajax" id="saveForm">
		<input type="hidden" id="userId" name="id" value="${bean.userId}" />
		<div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td>
						<div>修改账号:</div>
					</td>
					<td><span>${bean.userNo}</span></td>

				</tr>
				<tr>
					<td>
						<div>旧密码:</div>
					</td>
					<td><input name="oldPsw" type="text" id="txt_oldPsw"
						class="inw" />
					</td>

				</tr>
				<tr>
					<td>
						<div>新密码:</div>
					</td>
					<td><input name="newPsw" type="text" id="newPsw" class="inw"
						/>
					</td>

				</tr>

				<tr>
					<td>&nbsp;</td>
					<td><label id="butt" class="butt"> <input
							type="submit" name="btn_SaveData" value="提交" id="btn_SaveData"
							class="xybtn" /> </label>
					</td>

				</tr>
			</table>
		</div>
	</form>
</body>
</html>

