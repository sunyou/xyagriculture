<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>反馈</title>
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
                	txt_ResNote: "required"
                },
                messages: {
                	txt_ResNote: "请填写反馈说明"
                }
            });
        });
    </script>
</head>
<body>
	<c:if test="${!empty saveFlag}">
		<script>
			art.dialog.tips('${saveFlag}', 1.5);
		</script>
	</c:if>
	<form method="post" action="${ctx}/Base/Material/InquiryResSave.html"
		id="form1">
		<div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td><div class="th_text">质询日期:</div></td>
					<td><fmt:formatDate value="${bean.operateDate }"
							pattern="yyyy-MM-dd" /> <!-- <input name="txt_ResDate" type="text" id="txt_ResDate" class="Wdate inw" onclick="WdatePicker({ dateFmt: &#39;yyyy-MM-dd&#39; })" readonly="readonly" value="<fmt:formatDate value="${bean.operateDate }" pattern="yyyy-MM-dd"/>" /> -->
					</td>
				</tr>
				<tr>
					<td><div class="th_text">质询内容:</div></td>
					<td>${bean.reason}</td>
				</tr>
				<tr>
					<td><div class="th_text">反馈说明:</div></td>
					<td><textarea name="txt_ResNote" rows="4" cols="80"
							id="txt_ResNote" style="height:100px;">${bean.resnote }</textarea>
					</td>
				</tr>
				<tr>
					<td><div class="th_text">反馈人:</div></td>
					<td>${bean.resperson }</td>
				</tr>
			</table>
			<div align=center>
				<br>
				<br> <input type="submit" name="btn_Save" value="提交"
					id="btn_Save" class="xybtn" />&nbsp;&nbsp; <input type="button"
					name="btn_Cancel" value="取消" id="btn_Cancel"
					onclick="art.dialog.close()" class="cancelbtn" />
			</div>
		</div>
		<input type="hidden" name="ID" value="${bean.id }">
	</form>
</body>
</html>