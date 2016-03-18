<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>质询</title>
<link rel="Stylesheet" type="text/css"
	href="${ctx}/content/css/Custom.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
<link href="${ctx}/content/css/default.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
<script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
<script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
<script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
<script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                //debug: true,
				 onfocusout : false,
				 showErrors : function(errorMap, errorList) {
				   	var msg = "";  
				 	$.each(errorList, function(i, v) { 
				  	msg += (v.message + "\r\n");   });
				  	if (msg != "")  alert(msg);   
				}, 
                errorPlacement: function (error, element) {
                    //".AreaList"
                    //var placement = $(element).parents("td").next();
                    //placement.text('');
                    //error.appendTo(placement);
                },
                rules: {
                	txt_RejectReason: "required"
                },
                messages: {
                	txt_RejectReason: "请填写质询内容"
                }
            });
        });
    </script>

</head>
<body>
	<c:if test="${!empty saveFlag}">
		<script>showTips('${saveFlag }','${ctx}/Base/Material/InquirySave.html');</script>
	</c:if>
	<form method="post" action="${ctx}/Base/Material/InquirySave.html" id="form1">
		<div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0"
				cellspacing="0">
				
				<tr style="display:none">
					<td><div class="th_text">质询日期:</div></td>
					<td><input name="txt_Operate_Date1" type="text"
						id="txt_Operate_Date1" class="Wdate inw"
						onclick="WdatePicker({ dateFmt: &#39;yyyy-MM-dd&#39; })"
						readonly="readonly" value="${dateNow }" /></td>
				</tr>
				<tr>
					<td><div class="th_text">质询内容:</div></td>
					<td><textarea name="txt_RejectReason" rows="8" cols="80"
							id="txt_RejectReason"></textarea></td>
				</tr>
				<tr>
					<td><div class="th_text">质询人:</div></td>
					<td>${userName }</td>
				</tr>
			</table>
			<input type="hidden" name="hf_Apply_ID" id="hf_Apply_ID" /> 
			<input type="hidden" name="Object_ID" id="Object_ID" value="${Object_ID }" />
			<input type="hidden" name="CoFarmer_ID" id="CoFarmer_ID" value="${CoFarmer_ID }" /> 
			<input type="hidden" name="Type" id="Type" value="${Type }" />
			<div align=center>
				<br>
				<br> 
				<input type="submit" name="btn_Save" value="发送质询" id="btn_Save" class="xybtn" />&nbsp;&nbsp; 
				<input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
		</div>
	</form>
</body>
</html>
