<%@ page contentType="text/html;charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/common/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色编辑/新增</title>
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
                	userNo: "请填写编码",
                	userName: "请填写名称"
                },
                submitHandler : function() {
					ajaxSubmitForm($("#saveForm"), ajaxSubmitFormDefCallback);
				}
            });
	
        });
</script>
</head>
<body>
	<form method="post" action="sysrole/sysRoleSave.ajax" id="saveForm">
		<input type="hidden" id="optType" name="optType" value="${optType}" />
		<div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0"
				cellspacing="0">

				<tr>
					<td>
						<div>角色编码:</div>
					</td>
					<td><c:choose>
							<c:when test="${optType!='1'}">
								<input name="roleid" type="hidden" id="txt_User_No" class="inw"
									value="${bean.roleid}" />
								<span>${bean.roleid}</span>
							</c:when>
							<c:otherwise>
								<input name="roleid" type="text" id="txt_User_No" class="inw"
									value="${bean.rolename}" />
							</c:otherwise>
						</c:choose></td>

				</tr>
				<tr>
					<td>
						<div>角色名称:</div>
					</td>
					<td><input name="rolename" type="text" id="txt_User_Name"
						class="inw" value="${bean.rolename}" />
					</td>

				</tr>
				
				<c:if test="${optType!='3'}">
					<tr>
						<td>&nbsp;</td>
						<td><label id="butt" class="butt"> <input
								type="submit" name="btn_SaveData" value="提交" id="btn_SaveData"
								class="xybtn" /> </label>
						</td>

					</tr>
				</c:if>
			</table>
		</div>
	</form>
</body>
</html>

